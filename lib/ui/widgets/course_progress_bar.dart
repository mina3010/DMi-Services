import 'package:DMI/core/res/app_dimensions.dart';
import 'package:DMI/core/res/app_text_theme.dart';
import 'package:DMI/core/res/colors.dart';
import 'package:flutter/material.dart';

class CourseProgressBar extends StatelessWidget {
  const CourseProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    double p = 21 / 50;
    return Column(
      children: [
        Positioned.fill(
          child: LayoutBuilder(builder: (context, constraints) {
            return Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(
                right: (constraints.biggest.width * p) - 25.0,
                bottom: AppDMIensions.padding_8,
              ),
              child: CustomPaint(
                painter: ProgressArrowPaint(),
                child: Container(
                  padding: const EdgeInsets.all(
                    AppDMIensions.padding_4,
                  ),
                  child: Text(
                    'درس 21',
                    style: AppTextTheme.smallTextSize.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        LinearProgressIndicator(
          borderRadius: BorderRadius.circular(200),
          value: p,
          color: AppColors.colorAccent,
          backgroundColor: Colors.black.withOpacity(0.3),
        ),
        const SizedBox(height: AppDMIensions.padding_8),
      ],
    );
  }
}

class ProgressArrowPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.colorAccent
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    final path = Path()
      ..addRRect(RRect.fromRectAndCorners(
          Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)),
          topLeft: const Radius.circular(5),
          topRight: const Radius.circular(5),
          bottomLeft: const Radius.circular(5),
          bottomRight: const Radius.circular(5)))
      ..moveTo((size.width / 2) - 5, size.height)
      ..lineTo((size.width / 2) - 5, size.height)
      ..lineTo((size.width / 2), size.height + 5)
      ..lineTo((size.width / 2) + 5, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
