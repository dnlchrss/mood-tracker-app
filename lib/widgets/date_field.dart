import 'package:material_ui/material_ui.dart';
import '../theme/app_colors.dart';
import '../utils/date.dart';

class DateField extends StatelessWidget {
  final DateTime date;
  final VoidCallback onTap;

  const DateField({super.key, required this.date, required this.onTap});

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: AppColors.border),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                const Icon(Icons.calendar_today_outlined,
                    size: 18, color: AppColors.icon),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    formatDateLong(date),
                    style: const TextStyle(
                        fontSize: 13.5, color: AppColors.textDark),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down, color: AppColors.icon),
              ],
            ),
          ),
        ),
      );
}