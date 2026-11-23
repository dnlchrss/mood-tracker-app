import 'package:material_ui/material_ui.dart';
import '../models/mood.dart';
import '../theme/app_colors.dart';
import 'mood_face.dart';

class MoodPicker extends StatelessWidget {
  final MoodType selected;
  final ValueChanged<MoodType> onChanged;

  const MoodPicker({super.key, required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) => GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.1,
        children: [
          for (final m in MoodType.values)
            _MoodTile(
              type: m,
              selected: m == selected,
              onTap: () => onChanged(m),
            ),
        ],
      );
}

class _MoodTile extends StatelessWidget {
  final MoodType type;
  final bool selected;
  final VoidCallback onTap;

  const _MoodTile({
    required this.type,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: selected ? type.color : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected ? type.color : AppColors.border,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MoodFace(type: type, size: 38, showBody: !selected),
              const SizedBox(height: 6),
              Text(
                type.label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
      );
}