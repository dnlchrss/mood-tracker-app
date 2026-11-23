import 'package:material_ui/material_ui.dart';
import '../models/mood.dart';
import '../models/load.dart';

const _pink = Color(0xFFFF6FA5);
const _teal = Color(0xFF4DCDC5);
const _yellow = Color(0xFFFFC145);
const _blue = Color(0xFF5B9BF0);
const _purple = Color(0xFFB491F2);
const _red = Color(0xFFFF6B57);

const onboardingPages = [
  OnboardingData(
    title: 'Kenali Setiap\nPerasaanmu',
    description:
        'Setiap mood yang kamu rasakan itu berharga. Catat, pahami, dan rayakan perjalanan emosimu.',
    items: [
      IllustrationItem.circle(0.14, 0.41, 0.54, _pink,
          face: MoodType.bersemangat),
      IllustrationItem.circle(0.80, 0.80, 0.48, _teal, face: MoodType.tenang),
      IllustrationItem.face(0.50, 0.58, 0.34, MoodType.senang),
    ],
  ),
  OnboardingData(
    title: 'Catat Mood dalam\nHitungan Detik',
    description:
        'Pilih mood, tambahkan catatan singkat, dan selesai. Secepat itu untuk mengenal dirimu lebih baik.',
    items: [
      IllustrationItem.circle(0.76, 0.40, 0.54, _yellow, face: MoodType.senang),
      IllustrationItem.circle(0.10, 0.86, 0.44, _blue),
      IllustrationItem.face(0.31, 0.46, 0.24, MoodType.tenang),
      IllustrationItem.face(0.33, 0.71, 0.24, MoodType.sedih),
      IllustrationItem.face(0.64, 0.78, 0.24, MoodType.bersemangat),
    ],
  ),
  OnboardingData(
    title: 'Temukan Pola\n& Pemicunya',
    description:
        'Lihat tren emosimu dari waktu ke waktu dan pahami apa yang memengaruhi harimu.',
    items: [
      IllustrationItem.circle(0.10, 0.48, 0.52, _purple),
      IllustrationItem.circle(0.90, 0.88, 0.44, _red),
      IllustrationItem.face(0.25, 0.38, 0.17, MoodType.senang),
      IllustrationItem.face(0.50, 0.32, 0.19, MoodType.sedih),
      IllustrationItem.face(0.27, 0.60, 0.18, MoodType.tenang),
      IllustrationItem.face(0.49, 0.66, 0.18, MoodType.cemas),
      IllustrationItem.face(0.73, 0.59, 0.18, MoodType.bersemangat),
    ],
  ),
];
