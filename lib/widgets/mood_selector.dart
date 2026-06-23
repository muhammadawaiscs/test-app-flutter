import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../models/app_models.dart';
import '../utils/app_colors.dart';
import '../utils/app_spacing.dart';
import '../utils/app_text_styles.dart';

class MoodSelector extends StatefulWidget {
  const MoodSelector({
    super.key,
    required this.value,
    required this.mood,
    required this.onChanged,
  });

  final double value;
  final MoodOption mood;
  final ValueChanged<double> onChanged;

  @override
  State<MoodSelector> createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  static const double _size = 280;
  static const double _strokeWidth = 26;
  static const double _faceSize = 92;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size,
      height: _size + 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(_size, _size),
            painter: _MoodRingPainter(strokeWidth: _strokeWidth),
          ),
          _MoodHandle(
            size: _size,
            strokeWidth: _strokeWidth,
            value: widget.value,
            onChanged: widget.onChanged,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(
                  widget.mood.faceAsset,
                  width: _faceSize,
                  height: _faceSize,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(widget.mood.label, style: AppTextStyles.titleLarge),
            ],
          ),
        ],
      ),
    );
  }
}

class _MoodHandle extends StatelessWidget {
  const _MoodHandle({
    required this.size,
    required this.strokeWidth,
    required this.value,
    required this.onChanged,
  });

  final double size;
  final double strokeWidth;
  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final radius = (size - strokeWidth) / 2;
    final angle = -math.pi / 2 + (value * 2 * math.pi);
    final center = size / 2;
    final handleX = center + radius * math.cos(angle);
    final handleY = center + radius * math.sin(angle);

    return GestureDetector(
      onPanUpdate: (details) {
        final box = context.findRenderObject() as RenderBox?;
        if (box == null) return;

        final local = box.globalToLocal(details.globalPosition);
        final dx = local.dx - center;
        final dy = local.dy - center;
        var newAngle = math.atan2(dy, dx) + math.pi / 2;
        if (newAngle < 0) newAngle += 2 * math.pi;
        onChanged(newAngle / (2 * math.pi));
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          children: [
            Positioned(
              left: handleX - 15,
              top: handleY - 15,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.primaryText,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryText.withValues(alpha: 0.45),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.35),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoodRingPainter extends CustomPainter {
  _MoodRingPainter({required this.strokeWidth});

  static const _segmentCount = 15;
  /// Ring colors start at 12 o'clock and sweep clockwise (Figma).
  static const _gradientStartAngle = -math.pi / 2;

  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final segmentAngle = (2 * math.pi) / _segmentCount;

    final ringColors = [
      ...AppColors.moodRingSegments,
      AppColors.moodRingSegments.first,
    ];
    final ringStops = List<double>.generate(
      _segmentCount + 1,
      (index) => index / _segmentCount,
    );

    final ringPaint = Paint()
      ..shader = SweepGradient(
        startAngle: _gradientStartAngle,
        endAngle: _gradientStartAngle + (2 * math.pi),
        colors: ringColors,
        stops: ringStops,
        tileMode: TileMode.clamp,
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, 0, 2 * math.pi, false, ringPaint);

    final dividerPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.22)
      ..strokeWidth = 0.75;

    final innerRadius = radius - strokeWidth / 2 + 1;
    final outerRadius = radius + strokeWidth / 2 - 1;

    for (var i = 0; i < _segmentCount; i++) {
      final angle = _gradientStartAngle + (i * segmentAngle);
      final direction = Offset(math.cos(angle), math.sin(angle));
      canvas.drawLine(
        center + direction * innerRadius,
        center + direction * outerRadius,
        dividerPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _MoodRingPainter oldDelegate) {
    return oldDelegate.strokeWidth != strokeWidth;
  }
}
