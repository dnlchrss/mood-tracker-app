import 'package:material_ui/material_ui.dart';
import '../models/mood.dart';
import '../theme/app_colors.dart';
import 'mood_card.dart';

class MoodSectionView extends StatelessWidget {
  final MoodSection section;

  const MoodSectionView({super.key, required this.section});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                section.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
            ),
            for (final e in section.entries) MoodCard(entry: e),
          ],
        ),
      );
}