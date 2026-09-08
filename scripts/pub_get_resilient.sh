#!/bin/bash
# This sandbox's network intermittently kills long-lived downloads from
# storage.googleapis.com (seen with the Flutter SDK, fonts.zip, engine
# artifacts). flutter's own retry logic doesn't survive it because a
# half-written zip is left locked. This script: run the flutter command,
# and on failure, scrape the failed URL from its output, curl it into the
# exact cache path with aggressive retries, and try again.
set -uo pipefail
export PUB_CACHE=/c/FlutterSDK/.pub-cache
export CI=true
FLUTTER=/c/FlutterSDK/bin/flutter.bat
CACHE_ROOT=/c/FlutterSDK/bin/cache/downloads

cd "$(dirname "$0")/.."

for attempt in $(seq 1 15); do
  echo "=== attempt $attempt: flutter pub get ==="
  OUTPUT=$("$FLUTTER" pub get 2>&1)
  echo "$OUTPUT"
  if echo "$OUTPUT" | grep -q "Got dependencies"; then
    echo "=== pub get succeeded ==="
    exit 0
  fi

  URL=$(echo "$OUTPUT" | grep -oE "https://storage\.googleapis\.com/[^ ]+\.zip" | head -1)
  if [ -z "$URL" ]; then
    echo "=== pub get failed with no recognizable download URL; giving up ==="
    exit 1
  fi

  REL_PATH=${URL#https://storage.googleapis.com/}
  DEST="$CACHE_ROOT/storage.googleapis.com/$REL_PATH"
  echo "=== fetching $URL -> $DEST ==="
  mkdir -p "$(dirname "$DEST")"
  rm -f "$DEST"
  curl -L --retry 10 --retry-delay 3 --retry-all-errors -o "$DEST" "$URL"
  if [ ! -s "$DEST" ]; then
    echo "=== curl failed to produce a non-empty file; giving up ==="
    exit 1
  fi
done

echo "=== exhausted attempts ==="
exit 1
