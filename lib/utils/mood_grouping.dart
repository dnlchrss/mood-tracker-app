import '../models/mood.dart';
import 'date.dart';

List<MoodSection> groupEntries(List<MoodEntry> entries) {
  final sorted = [...entries]
    ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

  final groups = <DateTime, List<MoodEntry>>{};
  for (final e in sorted) {
    groups.putIfAbsent(dateOnly(e.createdAt), () => []).add(e);
  }

  return [
    for (final g in groups.entries) MoodSection(sectionTitle(g.key), g.value),
  ];
}