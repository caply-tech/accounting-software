import 'dart:io';

/// Minimal static file server for build/web, used to preview the app
/// locally before deployment. No external packages needed.
Future<void> main() async {
  final port = int.tryParse(Platform.environment['PORT'] ?? '') ?? 8090;
  final root = Directory('build/web');
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
  print('Serving build/web on http://localhost:$port');
  await for (final request in server) {
    var path = request.uri.path == '/' ? '/index.html' : request.uri.path;
    var file = File('${root.path}$path');
    if (!await file.exists()) {
      file = File('${root.path}/index.html');
    }
    final bytes = await file.readAsBytes();
    final contentType = switch (file.path.split('.').last) {
      'html' => 'text/html',
      'js' => 'application/javascript',
      'json' => 'application/json',
      'wasm' => 'application/wasm',
      'png' => 'image/png',
      'ico' => 'image/x-icon',
      _ => 'application/octet-stream',
    };
    request.response.headers.contentType = ContentType.parse(contentType);
    request.response.add(bytes);
    await request.response.close();
  }
}
