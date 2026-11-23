import 'package:material_ui/material_ui.dart';
import '../data/dummy_data.dart';
import '../models/mood.dart';
import '../theme/app_colors.dart';
import '../utils/mood_grouping.dart';
import '../widgets/home_header.dart';
import '../widgets/mood_section_view.dart';
import '../widgets/streak_chip.dart';
import 'add_mood_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MoodEntry> _entries = [...initialEntries];

  Future<void> _addEntry() async {
    final entry = await Navigator.push<MoodEntry>(
      context,
      MaterialPageRoute(builder: (_) => const AddMoodPage()),
    );
    if (entry != null) setState(() => _entries.add(entry));
  }

  Future<void> _editEntry(MoodEntry old) async {
    final updated = await Navigator.push<MoodEntry>(
      context,
      MaterialPageRoute(builder: (_) => AddMoodPage(initial: old)),
    );
    if (updated == null) return;
    final i = _entries.indexOf(old);
    if (i != -1) setState(() => _entries[i] = updated);
  }

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
            for (final s in groupEntries(_entries))
              MoodSectionView(section: s, onEntryTap: _editEntry),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEntry,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}