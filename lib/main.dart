import 'package:material_ui/material_ui.dart';
import 'pages/homepage.dart';
import 'theme/app_colors.dart';

void main() => runApp(const MoodTrackerApp());

class MoodTrackerApp extends StatelessWidget {
  const MoodTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const HomePage(),
    );
  }
}