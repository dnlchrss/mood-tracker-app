import 'package:material_ui/material_ui.dart';
import '../models/load.dart';
import '../theme/app_colors.dart';
import 'illustration.dart';

class OnboardingSlide extends StatelessWidget {
  final OnboardingData data;

  const OnboardingSlide({super.key, required this.data});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(child: IllustrationView(items: data.items)),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    height: 1.25,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  data.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13.5,
                    height: 1.5,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
        ],
      );
}