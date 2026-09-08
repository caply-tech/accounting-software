import 'package:drift/drift.dart' show OrderingTerm;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../shared/db/business_database.dart';
import '../../shared/state/app_databases.dart';
import '../../shared/state/session.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/format.dart';
import '../../shared/widgets/stat_card.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final business = context.watch<SessionState>().currentBusiness;
    if (business == null) return const Center(child: Text('No business selected.'));
    final db = context.watch<AppDatabases>().businessDb(business.dbFilename);

    return StreamBuilder<List<CalendarEvent>>(
      stream: (db.select(db.calendarEvents)..orderBy([(e) => OrderingTerm.asc(e.eventDate)])).watch(),
      builder: (context, snapshot) {
        final events = snapshot.data ?? const <CalendarEvent>[];
        final upcoming = events.where((e) => e.eventDate.isAfter(DateTime.now().subtract(const Duration(days: 1)))).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatCard(label: 'Total Events', value: '${events.length}', icon: Icons.event_rounded, iconColor: AppColors.info, iconBg: AppColors.infoBg),
                const SizedBox(width: 16),
                ElevatedButton.icon(onPressed: () => _showCreateEventDialog(context, db), icon: const Icon(Icons.add), label: const Text('Create Event')),
              ],
            ),
            const SizedBox(height: 20),
            SectionCard(
              title: 'Upcoming Schedule',
              child: SizedBox(
                width: 700,
                child: upcoming.isEmpty
                    ? const Padding(padding: EdgeInsets.all(20), child: Text('No events scheduled.', style: TextStyle(color: AppColors.navySoft)))
                    : DataTable(
                        columns: const [
                          DataColumn(label: Text('Date')),
                          DataColumn(label: Text('Time')),
                          DataColumn(label: Text('Title')),
                          DataColumn(label: Text('Type')),
                          DataColumn(label: Text('Attendees')),
                        ],
                        rows: [
                          for (final e in upcoming)
                            DataRow(cells: [
                              DataCell(Text(formatDate(e.eventDate))),
                              DataCell(Text('${e.startTime} – ${e.endTime}')),
                              DataCell(Text(e.title, style: const TextStyle(fontWeight: FontWeight.w600))),
                              DataCell(_typeBadge(e.eventType)),
                              DataCell(Text('${e.attendeeCount}')),
                            ]),
                        ],
                      ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _typeBadge(String type) {
    final tone = switch (type) {
      'management' => StatusTone.warning,
      'finance' => StatusTone.info,
      'board' => StatusTone.neutral,
      _ => StatusTone.success,
    };
    return StatusBadge(type[0].toUpperCase() + type.substring(1), tone: tone);
  }

  Future<void> _showCreateEventDialog(BuildContext context, BusinessDatabase db) async {
    final titleCtrl = TextEditingController();
    final startCtrl = TextEditingController(text: '10:00 AM');
    final endCtrl = TextEditingController(text: '11:00 AM');
    String type = 'management';
    DateTime date = DateTime.now();

    await showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Create Event'),
          content: SizedBox(
            width: 380,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: 'Event title')),
                const SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Date: ${formatDate(date)}'),
                  trailing: const Icon(Icons.calendar_today_rounded, size: 18),
                  onTap: () async {
                    final picked = await showDatePicker(context: context, initialDate: date, firstDate: DateTime(2020), lastDate: DateTime(2100));
                    if (picked != null) setState(() => date = picked);
                  },
                ),
                Row(
                  children: [
                    Expanded(child: TextField(controller: startCtrl, decoration: const InputDecoration(labelText: 'Start'))),
                    const SizedBox(width: 12),
                    Expanded(child: TextField(controller: endCtrl, decoration: const InputDecoration(labelText: 'End'))),
                  ],
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: type,
                  decoration: const InputDecoration(labelText: 'Event type'),
                  items: const [
                    DropdownMenuItem(value: 'management', child: Text('Management')),
                    DropdownMenuItem(value: 'finance', child: Text('Finance')),
                    DropdownMenuItem(value: 'staff', child: Text('Staff')),
                    DropdownMenuItem(value: 'board', child: Text('Board / Executive')),
                  ],
                  onChanged: (v) => setState(() => type = v ?? 'management'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () async {
                if (titleCtrl.text.trim().isEmpty) return;
                await db.into(db.calendarEvents).insert(
                      CalendarEventsCompanion.insert(
                        id: const Uuid().v4(),
                        title: titleCtrl.text.trim(),
                        eventType: type,
                        eventDate: date,
                        startTime: startCtrl.text.trim(),
                        endTime: endCtrl.text.trim(),
                        createdByUserId: 'admin',
                      ),
                    );
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Create Event'),
            ),
          ],
        ),
      ),
    );
  }
}
