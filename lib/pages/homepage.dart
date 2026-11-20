import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../theme/app_colors.dart';
import '../widgets/home_header.dart';
import '../widgets/mood_selection_view.dart';
import '../widgets/streak_chip.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 100)
          children: [
            const HomeHeader(name: userName),
            const SizedBox(height: 16)
            const StreakChip(days: streakDays),
            const SizedBox(height: 24),
            for (final s in sections)
          ]
        ),)
}