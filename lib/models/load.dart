import 'package:material_ui/material_ui.dart';
import 'mood.dart';

class IllustrationItem {
  final double x, y, size;
  final Color? circleColor;
  final MoodType? face;

  const IllustrationItem.circle(this.x, this.y, this.size, this.circleColor,
      {this.face});

  const IllustrationItem.face(this.x, this.y, this.size, this.face)
      : circleColor = null;
}

class OnboardingData {
  final String title;
  final String description;
  final List<IllustrationItem> items;

  const OnboardingData({
    required this.title,
    required this.description,
    required this.items,
  });
}