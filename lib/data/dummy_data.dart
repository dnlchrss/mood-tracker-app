import '../models/mood.dart';

const userName = 'Christoo';
const streakDays = 5;

DateTime _at(int daysAgo, int h, int m) {
  final n = DateTime.now();
  return DateTime(n.year, n.month, n.day - daysAgo, h, m);
}

final initialEntries = [
  MoodEntry(MoodType.bersemangat, _at(0, 14, 20), 'GTA VI rilis'),
  MoodEntry(MoodType.tenang, _at(0, 11, 0), 'Besok ga ada quiz'),
  MoodEntry(MoodType.senang, _at(0, 8, 30), 'Nilai quiz DDP bagus'),
  MoodEntry(MoodType.sedih, _at(1, 20, 15), 'Interet lemot'),
  MoodEntry(MoodType.cemas, _at(1, 9, 0), 'Tugas kuliah banyak'),
];