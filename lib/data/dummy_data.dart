import '../models/mood.dart';

const userName = 'Christo';
const streakDays = 5;

const sections = [
  MoodSection('Hari ini', [
    MoodEntry(MoodType.cemas, '09:00', 'Nilai UTS udah dirilis tapi blom liat'),
    MoodEntry(MoodType.tenang, '15:30', 'besoknya libur'),
    MoodEntry(MoodType.senang, '18:00', 'Makan enak di rumah'),
  ]),
  MoodSection('Kemarin', [
    MoodEntry(MoodType.sedih, '10:00', 'Dapet nilai jelek di quiz DDP'),
    MoodEntry(MoodType.bersemangat, '15:30', 'Nonton film'),
  ]),
];