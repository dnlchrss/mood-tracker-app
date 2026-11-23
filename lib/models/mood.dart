import 'package:material_ui/material_ui.dart';

enum Eyes { dots, closed, sad, worried }
enum Mouth {open, smile, bigSmile, frown, wavy }

enum MoodType {
  bersemangat('Bersemangat', Color(0xFFFF6FA5), Eyes.dots, Mouth.open),
  tenang('Tenang', Color(0xFF3CCBBE), Eyes.closed, Mouth.smile),
  senang('Senang', Color(0xFFFFBE3D), Eyes.dots, Mouth.bigSmile),
  sedih('Sedih', Color(0xFF5B9BF0), Eyes.sad, Mouth.frown, tear: true),
  cemas('Cemas', Color(0xFFB491F2), Eyes.worried, Mouth.wavy);

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
  final String time;
  final String note;

  const MoodEntry(this.type, this.time, this.note);
}

/// Sekelompok catatan dengan judul, misalnya "Hari Ini" atau "Kemarin".
class MoodSection {
  final String title;
  final List<MoodEntry> entries;

  const MoodSection(this.title, this.entries);
}