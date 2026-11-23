import 'package:material_ui/material_ui.dart';
import '../theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  final String name;
  final String subtitle;

  const HomeHeader({
    super.key,
    required this.name,
    this.subtitle = 'Bagaimana perasaanmu hari ini?',
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, $name 👋',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 14, color: AppColors.textGrey),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.lavender,
            child: Text(
              name.isEmpty ? '?' : name[0].toUpperCase(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      );
}