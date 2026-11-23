import 'package:material_ui/material_ui.dart';
import '../theme/app_colors.dart';

/// Chip lavender kecil, misalnya "🔥 5 hari berturut-turut mencatat mood".
class StreakChip extends StatelessWidget {
  final int days;

  const StreakChip({super.key, required this.days});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.lavender,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '🔥  $days hari berturut-turut mencatat mood',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
        ),
      );
}