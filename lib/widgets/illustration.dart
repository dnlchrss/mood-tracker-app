import 'package:material_ui/material_ui.dart';
import '../models/load.dart';
import 'mood_face.dart';

class IllustrationView extends StatelessWidget {
  final List<IllustrationItem> items;

  const IllustrationView({super.key, required this.items});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, c) {
          final w = c.maxWidth, h = c.maxHeight;
          return ClipRect(
            child: Stack(
              children: [for (final item in items) _place(item, w, h)],
            ),
          );
        },
      );

  Widget _place(IllustrationItem item, double w, double h) {
    final s = item.size * w;
    final circle = item.circleColor;

    return Positioned(
      left: item.x * w - s / 2,
      top: item.y * h - s / 2,
      width: s,
      height: s,
      child: circle == null
          ? MoodFace(type: item.face!, size: s)
          : DecoratedBox(
              decoration: BoxDecoration(color: circle, shape: BoxShape.circle),
              child: item.face == null
                  ? null
                  : Center(
                      child: MoodFace(
                        type: item.face!,
                        size: s * 0.34,
                        showBody: false,
                      ),
                    ),
            ),
    );
  }
}