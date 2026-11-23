import '../models/mood.dart';

const userName = 'Christo';
const streakDays = 5;

const sections = [
  MoodSection('Hari ini', [
    MoodEntry(MoodType.bersemangat, '09:00', 'Dapet 100 di quiz DDP'),
    MoodEntry(MoodType.tenang, '15:30', 'Nonton film'),
  ]),
  MoodSection('Kemarin', [
    MoodEntry(MoodType.sedih, '10:00', 'Dapet nilai jelek di quiz DDP'),
    MoodEntry(MoodType.bersemangat, '15:30', 'Nonton film'),
  ]),
];