import 'package:material_ui/material_ui.dart';
import '../theme/app_colors.dart';

class FieldLabel extends StatelessWidget {
  final String text;

  const FieldLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(fontSize: 12.5, color: AppColors.textGrey),
      );
}