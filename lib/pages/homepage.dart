import 'package:material_ui/material_ui.dart';
import '../data/dummy_data.dart';
import '../theme/app_colors.dart';
import '../widgets/home_header.dart';
import '../widgets/mood_section_view.dart';
import '../widgets/streak_chip.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
          children: [
            const HomeHeader(name: userName),
            const SizedBox(height: 16),
            const StreakChip(days: streakDays),
            const SizedBox(height: 24),
            for (final s in sections) MoodSectionView(section: s),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Pindah ke halaman mood entry baru
        },
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}