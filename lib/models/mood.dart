import 'package:material_ui/material_ui.dart';

enum Eyes { dots, closed, sad, worried, angry }

enum Mouth { open, smile, bigSmile, frown, wavy }

enum MoodType {
  senang('Senang', Color(0xFFFFBE3D), Eyes.dots, Mouth.bigSmile),
  sedih('Sedih', Color(0xFF5B9BF0), Eyes.sad, Mouth.frown, tear: true),
  marah('Marah', Color(0xFFFF6B57), Eyes.angry, Mouth.frown),
  tenang('Tenang', Color(0xFF3CCBBE), Eyes.closed, Mouth.smile),
  cemas('Cemas', Color(0xFFB491F2), Eyes.worried, Mouth.wavy),
  bersemangat('Bersemangat', Color(0xFFFF6FA5), Eyes.dots, Mouth.open);

  final String label;
  final Color color;
  final Eyes eyes;
  final Mouth mouth;
  final bool tear;

  const MoodType(this.label, this.color, this.eyes, this.mouth,
      {this.tear = false});
}

/// Satu catatan mood.
class MoodEntry {
  final MoodType type;
  final DateTime createdAt;
  final String note;

  const MoodEntry(this.type, this.createdAt, this.note);

  /// Jam dalam format "08:30".
  String get time =>
      '${createdAt.hour.toString().padLeft(2, '0')}:${createdAt.minute.toString().padLeft(2, '0')}';
}

/// Sekelompok catatan dengan judul, misalnya "Hari Ini" atau "Kemarin".
class MoodSection {
  final String title;
  final List<MoodEntry> entries;

  const MoodSection(this.title, this.entries);
}