import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/db/seed_data.dart';
import '../../shared/state/app_databases.dart';
import '../../shared/theme/app_theme.dart';

/// The mockup's page-6 "First-Run Setup Screen" — shown once, the very
/// first time the app opens on a device. Persists the chosen [setup_mode]
/// into `app_settings` and seeds the initial businesses, then hands off to
/// the normal sign-in flow.
///
/// Per the architecture deck: "the choice is stored as a simple setting...
/// no change to how the data is organised and no change to later phases."
/// Choosing "Local network (LAN)" or "Cloud sync" here records the intent
/// only — the LAN host/client networking and cloud sync module themselves
/// are future phases, not yet built. Nothing about local, offline use of
/// this device depends on that other code existing.
class FirstRunSetupScreen extends StatefulWidget {
  const FirstRunSetupScreen({super.key, required this.onComplete});

  final VoidCallback onComplete;

  @override
  State<FirstRunSetupScreen> createState() => _FirstRunSetupScreenState();
}

enum _SetupMode { thisDeviceOnly, lan, cloudSync }

class _FirstRunSetupScreenState extends State<FirstRunSetupScreen> {
  _SetupMode _selected = _SetupMode.lan;
  bool _saving = false;

  static const _modeValues = {
    _SetupMode.thisDeviceOnly: 'this_device_only',
    _SetupMode.lan: 'lan',
    _SetupMode.cloudSync: 'cloud_sync',
  };

  Future<void> _continue() async {
    setState(() => _saving = true);
    try {
      final databases = context.read<AppDatabases>();
      await seedIfEmpty(databases.core, databases.businessDb, setupMode: _modeValues[_selected]!);
      widget.onComplete();
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Container(
            width: 560,
            padding: const EdgeInsets.all(36),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 24, offset: const Offset(0, 8))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryDark]),
                    ),
                    child: const Icon(Icons.show_chart_rounded, color: Colors.white, size: 32),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('First-Run Setup', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.navy)),
                const SizedBox(height: 6),
                const Text(
                  'Shown once. Every later launch goes straight to Sign In.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.5, color: AppColors.navySoft),
                ),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 20),

                _ModeOption(
                  title: 'This device only',
                  subtitle: 'One database on this machine',
                  description: 'Fastest to start, fully private, no setup at all. Best for one person or a quick trial.',
                  badge: null,
                  selected: _selected == _SetupMode.thisDeviceOnly,
                  onTap: () => setState(() => _selected = _SetupMode.thisDeviceOnly),
                ),
                const SizedBox(height: 12),
                _ModeOption(
                  title: 'Local network (LAN)',
                  subtitle: 'Shared over office Wi-Fi, no internet',
                  description: 'One device holds the database; the others connect to it over the office Wi-Fi. Everyone sees the same live data with no internet.',
                  badge: 'Recommended',
                  selected: _selected == _SetupMode.lan,
                  onTap: () => setState(() => _selected = _SetupMode.lan),
                ),
                const SizedBox(height: 12),
                _ModeOption(
                  title: 'Cloud sync',
                  subtitle: 'Optional, needs internet',
                  description: 'Adds an off-site backup and access from anywhere. A separate future module — never something core offline use depends on.',
                  badge: 'Coming soon',
                  selected: _selected == _SetupMode.cloudSync,
                  onTap: () => setState(() => _selected = _SetupMode.cloudSync),
                ),

                const SizedBox(height: 24),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _saving ? null : _continue,
                    child: _saving
                        ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : const Text('Continue', style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors.border)),
                  child: const Row(
                    children: [
                      Icon(Icons.info_outline_rounded, size: 18, color: AppColors.navySoft),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'This only saves a setting for now — sharing over Wi-Fi and cloud sync are built in a later update. Choosing them today does not connect to anything.',
                          style: TextStyle(fontSize: 11.5, color: AppColors.navySoft),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ModeOption extends StatelessWidget {
  const _ModeOption({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.badge,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String description;
  final String? badge;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary.withValues(alpha: 0.06) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? AppColors.primary : AppColors.border, width: selected ? 1.6 : 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              selected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
              color: selected ? AppColors.primary : AppColors.navySoft,
              size: 22,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14.5, color: AppColors.navy)),
                      if (badge != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: badge == 'Recommended' ? AppColors.successBg : AppColors.warningBg,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            badge!,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: badge == 'Recommended' ? AppColors.success : AppColors.warning,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600, color: AppColors.navySoft)),
                  const SizedBox(height: 6),
                  Text(description, style: const TextStyle(fontSize: 12, color: AppColors.navySoft, height: 1.35)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
