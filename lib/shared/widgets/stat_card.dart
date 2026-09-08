import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    this.trend,
    this.trendUp = true,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String? trend;
  final bool trendUp;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontSize: 12.5, color: AppColors.navySoft, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  Text(value, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: AppColors.navy)),
                  if (trend != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(trendUp ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
                            size: 13, color: trendUp ? AppColors.success : AppColors.critical),
                        const SizedBox(width: 2),
                        Text(trend!, style: TextStyle(fontSize: 11.5, color: trendUp ? AppColors.success : AppColors.critical, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Wraps a [DataTable] (or any wide content) in its own horizontal scroll
/// container so the page itself never scrolls sideways — the same content
/// section title / "View All" affordance used throughout the mock design.
class SectionCard extends StatelessWidget {
  const SectionCard({super.key, required this.title, this.action, required this.child, this.padding});

  final String title;
  final Widget? action;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w800, color: AppColors.navy)),
                if (action != null) action!,
              ],
            ),
            const SizedBox(height: 14),
            SingleChildScrollView(scrollDirection: Axis.horizontal, child: child),
          ],
        ),
      ),
    );
  }
}
