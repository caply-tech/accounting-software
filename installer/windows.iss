; Inno Setup script — packages the Flutter Windows release build into a
; proper installer (Start Menu entry, uninstaller, optional desktop icon).
;
; Prerequisites (one-time, on the machine building the installer):
;   1. Install Inno Setup (free): https://jrsoftware.org/isdl.php
;   2. Build the release app first — this script packages that output, it
;      does not build the Flutter app itself:
;        flutter build windows --release
;
; To build the installer:
;   - Open this file in Inno Setup and click Compile, OR from a command
;     line with Inno Setup on PATH:
;       iscc installer\windows.iss
;   - Output: installer\output\AccountingManagementSoftware-Setup-<version>.exe
;
; Update #define MyAppVersion below to match pubspec.yaml's `version:` before
; cutting a release — Inno Setup can't read pubspec.yaml itself.

#define MyAppName "Accounting Management Software"
#define MyAppVersion "0.1.0"
#define MyAppPublisher "Caply"
#define MyAppExeName "accounting_software.exe"
#define MyReleaseDir "..\build\windows\x64\runner\Release"

[Setup]
AppId={{8F1D9F3E-6C4A-4B2E-9C7C-3E7B4E6C7A11}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppPublisher}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=output
OutputBaseFilename=AccountingManagementSoftware-Setup-{#MyAppVersion}
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64compatible
UninstallDisplayIcon={app}\{#MyAppExeName}
; Per-machine by default (needs admin) since it installs under Program
; Files; the app's own data (see docs/database-architecture.md) always
; lives in the current Windows user's AppData regardless of install mode.
PrivilegesRequired=admin

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop shortcut"; GroupDescription: "Additional shortcuts:"; Flags: unchecked

[Files]
Source: "{#MyReleaseDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent

; Deliberately no [UninstallDelete] entry for the AppData database folder —
; uninstalling the app must never silently delete a client's financial
; records. If a clean uninstall (including data) is ever needed, do it as
; an explicit, separate step, not a default of this installer.
