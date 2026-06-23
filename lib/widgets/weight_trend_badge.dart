import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class WeightTrendBadge extends StatelessWidget {
  const WeightTrendBadge({
    super.key,
    required this.changeKg,
  });

  final double changeKg;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _WeightTrendIcon(),
        const SizedBox(width: 6),
        Text(
          '+${changeKg}kg',
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12,
            color: AppColors.accentGreen,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _WeightTrendIcon extends StatelessWidget {
  const _WeightTrendIcon();

  static const double _size = 18;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size,
      height: _size,
      child: CustomPaint(
        painter: _WeightTrendIconPainter(),
      ),
    );
  }
}

class _WeightTrendIconPainter extends CustomPainter {
  static const Color _circleColor = Color(0xFF2A5C45);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(
      center,
      radius,
      Paint()..color = _circleColor,
    );

    final arrowPaint = Paint()
      ..color = AppColors.accentGreen
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final inset = size.width * 0.3;
    final start = Offset(inset, size.height - inset);
    final end = Offset(size.width - inset, inset);

    canvas.drawLine(start, end, arrowPaint);

    const head = 2.8;
    canvas.drawLine(end, Offset(end.dx - head, end.dy), arrowPaint);
    canvas.drawLine(end, Offset(end.dx, end.dy + head), arrowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
