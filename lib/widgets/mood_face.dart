import 'package:material_ui/material_ui.dart';
import '../models/mood.dart';
import '../theme/app_colors.dart';

class MoodFace extends StatelessWidget {
  final MoodType type;
  final double size;
  final bool showBody;

  const MoodFace({
    super.key,
    required this.type,
    this.size = 52,
    this.showBody = true,
  });

  @override
  Widget build(BuildContext context) => CustomPaint(
        size: Size.square(size),
        painter: _FacePainter(type, showBody),
      );
}

class _FacePainter extends CustomPainter {
  final MoodType type;
  final bool showBody;
  _FacePainter(this.type, this.showBody);

  @override
  void paint(Canvas canvas, Size s) {
    final w = s.width, h = s.height;
    const ink = AppColors.textDark;

    final fill = Paint()..color = ink;
    final line = Paint()
      ..color = ink
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.05
      ..strokeCap = StrokeCap.round;

    // Helper: kurva dari (ax, ay) ke (bx, by) lewat titik kontrol (cx, cy).
    // Semua koordinat 0..1 relatif terhadap ukuran wajah.
    Path curve(double ax, double ay, double cx, double cy, double bx, double by) =>
        Path()
          ..moveTo(w * ax, h * ay)
          ..quadraticBezierTo(w * cx, h * cy, w * bx, h * by);

    // Badan + kilau
    if (showBody) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(Offset.zero & s, Radius.circular(w * 0.42)),
        Paint()..color = type.color,
      );
      canvas.drawCircle(
          Offset(w * 0.8, h * 0.17), w * 0.03, Paint()..color = Colors.white70);
    }

    // Mata
    for (final x in [0.33, 0.67]) {
      final dir = x < 0.5 ? 1 : -1; // arah alis
      switch (type.eyes) {
        case Eyes.dots:
          canvas.drawCircle(Offset(w * x, h * 0.42), w * 0.06, fill);
        case Eyes.closed:
          canvas.drawPath(curve(x - 0.09, 0.42, x, 0.5, x + 0.09, 0.42), line);
        case Eyes.sad:
          canvas.drawPath(curve(x - 0.08, 0.4, x, 0.47, x + 0.08, 0.4), line);
        case Eyes.worried:
          canvas.drawCircle(Offset(w * x, h * 0.44), w * 0.05, fill);
          canvas.drawLine(
            Offset(w * (x - 0.09 * dir), h * 0.3),
            Offset(w * (x + 0.07 * dir), h * 0.26),
            line,
          );
        case Eyes.angry:
          canvas.drawCircle(Offset(w * x, h * 0.45), w * 0.05, fill);
          canvas.drawLine(
            Offset(w * (x - 0.09 * dir), h * 0.3),
            Offset(w * (x + 0.09 * dir), h * 0.37),
            line,
          );
      }
    }

    // Mulut
    switch (type.mouth) {
      case Mouth.open:
        canvas.drawOval(
          Rect.fromCenter(
              center: Offset(w * 0.5, h * 0.66), width: w * 0.2, height: h * 0.24),
          fill,
        );
      case Mouth.smile:
        canvas.drawPath(curve(0.38, 0.62, 0.5, 0.72, 0.62, 0.62), line);
      case Mouth.bigSmile:
        canvas.drawPath(curve(0.3, 0.6, 0.5, 0.82, 0.7, 0.6), line);
      case Mouth.frown:
        canvas.drawPath(curve(0.34, 0.72, 0.5, 0.56, 0.66, 0.72), line);
      case Mouth.wavy:
        canvas.drawPath(
          Path()
            ..moveTo(w * 0.3, h * 0.68)
            ..quadraticBezierTo(w * 0.38, h * 0.6, w * 0.46, h * 0.68)
            ..quadraticBezierTo(w * 0.54, h * 0.76, w * 0.62, h * 0.68)
            ..quadraticBezierTo(w * 0.66, h * 0.64, w * 0.7, h * 0.66),
          line,
        );
    }

    // Air mata (opsional)
    if (type.tear) {
      canvas.drawOval(
        Rect.fromCenter(
            center: Offset(w * 0.74, h * 0.55), width: w * 0.07, height: h * 0.1),
        Paint()..color = Colors.white70,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _FacePainter old) =>
      old.type != type || old.showBody != showBody;
}