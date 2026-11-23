import 'package:material_ui/material_ui.dart';
import '../data/load_data.dart';
import '../theme/app_colors.dart';
import '../widgets/load_slide.dart';
import '../widgets/page_dots.dart';
import '../widgets/primary_button.dart';
import 'homepage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  int _index = 0;

  bool get _isLast => _index == onboardingPages.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _finish() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  void _next() {
    if (_isLast) {
      _finish();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: _isLast
                  ? null
                  : Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: _finish,
                        child: const Text(
                          'Lewati',
                          style: TextStyle(
                              fontSize: 13, color: AppColors.textGrey),
                        ),
                      ),
                    ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingPages.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) =>
                    OnboardingSlide(data: onboardingPages[i]),
              ),
            ),
            PageDots(count: onboardingPages.length, index: _index),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PrimaryButton(
                label: _isLast ? 'Mulai Sekarang' : 'Lanjut',
                onPressed: _next,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}