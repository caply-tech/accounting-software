import 'package:flutter/material.dart';

import '../state/session.dart';
import '../theme/app_theme.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.businesses,
    required this.currentBusiness,
    required this.onSwitchBusiness,
    required this.user,
  });

  final String title;
  final String subtitle;
  final List<BusinessSummary> businesses;
  final BusinessSummary? currentBusiness;
  final ValueChanged<BusinessSummary> onSwitchBusiness;
  final CurrentUser? user;

  @override
  Size get preferredSize => const Size.fromHeight(84);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.navy)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(fontSize: 13, color: AppColors.navySoft)),
              ],
            ),
          ),
          if (businesses.isNotEmpty) _BusinessSelector(businesses: businesses, current: currentBusiness, onSwitch: onSwitchBusiness),
          const SizedBox(width: 16),
          const Icon(Icons.notifications_none_rounded, color: AppColors.navySoft),
          const SizedBox(width: 20),
          CircleAvatar(radius: 18, backgroundColor: AppColors.border, child: const Icon(Icons.person, color: AppColors.navySoft, size: 20)),
          const SizedBox(width: 10),
          if (user != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user!.fullName, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                Text(user!.roleLabel, style: const TextStyle(fontSize: 11.5, color: AppColors.navySoft)),
              ],
            ),
        ],
      ),
    );
  }
}

class _BusinessSelector extends StatelessWidget {
  const _BusinessSelector({required this.businesses, required this.current, required this.onSwitch});
  final List<BusinessSummary> businesses;
  final BusinessSummary? current;
  final ValueChanged<BusinessSummary> onSwitch;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(border: Border.all(color: AppColors.border), borderRadius: BorderRadius.circular(8)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: current?.id,
          icon: const Icon(Icons.expand_more_rounded, size: 18),
          items: [
            for (final b in businesses)
              DropdownMenuItem(value: b.id, child: Text(b.name, style: const TextStyle(fontSize: 13.5))),
          ],
          onChanged: (id) {
            final match = businesses.where((b) => b.id == id).firstOrNull;
            if (match != null) onSwitch(match);
          },
        ),
      ),
    );
  }
}
