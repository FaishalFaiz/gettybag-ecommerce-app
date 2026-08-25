import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// GettyBag Brand Logo Widget
/// Renders the app icon — a stylized open book with a bookmark ribbon,
/// designed to evoke both reading/literature and the "bag" in GettyBag.
///
/// Usage:
///   GettyBagLogo(size: 80)
///   GettyBagLogo(size: 80, color: Colors.white, showBackground: true)
class GettyBagLogo extends StatelessWidget {
  final double size;
  final Color? color;
  final bool showBackground;

  const GettyBagLogo({
    super.key,
    this.size = 64,
    this.color,
    this.showBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? AppColors.primary;

    Widget icon = CustomPaint(
      size: Size(size, size),
      painter: _GettyBagLogoPainter(
        primaryColor: iconColor,
        accentColor: AppColors.accent,
      ),
    );

    if (showBackground) {
      return Container(
        width: size * 1.4,
        height: size * 1.4,
        decoration: BoxDecoration(
          color: AppColors.canvas,
          borderRadius: BorderRadius.circular(size * 0.28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Center(child: icon),
      );
    }

    return icon;
  }
}

/// Custom painter for the GettyBag logo icon.
/// Draws a stylized open book with:
/// - Two open pages (left and right)
/// - A spine line in the center
/// - A gold bookmark ribbon on the right page
/// - Subtle page lines on the left page
/// - A bag handle arc above the book
class _GettyBagLogoPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;

  const _GettyBagLogoPainter({
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // ── Cover base (background rounded rect) ────────────────────────────
    final coverPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    final coverRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.05, h * 0.15, w * 0.9, h * 0.72),
      Radius.circular(w * 0.08),
    );
    canvas.drawRRect(coverRect, coverPaint);

    // ── Left page ────────────────────────────────────────────────────────
    final leftPagePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.95)
      ..style = PaintingStyle.fill;

    final leftPagePath = Path()
      ..moveTo(w * 0.48, h * 0.22)
      ..lineTo(w * 0.12, h * 0.22)
      ..quadraticBezierTo(w * 0.08, h * 0.22, w * 0.08, h * 0.28)
      ..lineTo(w * 0.08, h * 0.76)
      ..quadraticBezierTo(w * 0.08, h * 0.82, w * 0.12, h * 0.82)
      ..lineTo(w * 0.48, h * 0.82)
      ..close();
    canvas.drawPath(leftPagePath, leftPagePaint);

    // ── Right page ───────────────────────────────────────────────────────
    final rightPagePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.85)
      ..style = PaintingStyle.fill;

    final rightPagePath = Path()
      ..moveTo(w * 0.52, h * 0.22)
      ..lineTo(w * 0.88, h * 0.22)
      ..quadraticBezierTo(w * 0.92, h * 0.22, w * 0.92, h * 0.28)
      ..lineTo(w * 0.92, h * 0.76)
      ..quadraticBezierTo(w * 0.92, h * 0.82, w * 0.88, h * 0.82)
      ..lineTo(w * 0.52, h * 0.82)
      ..close();
    canvas.drawPath(rightPagePath, rightPagePaint);

    // ── Spine (center line) ──────────────────────────────────────────────
    final spinePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.035
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(w * 0.50, h * 0.20),
      Offset(w * 0.50, h * 0.84),
      spinePaint,
    );

    // ── Text lines (left page) ───────────────────────────────────────────
    final linePaint = Paint()
      ..color = primaryColor.withValues(alpha: 0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.025
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 4; i++) {
      final y = h * (0.35 + i * 0.1);
      final xEnd = (i == 2) ? w * 0.38 : w * 0.44;
      canvas.drawLine(Offset(w * 0.14, y), Offset(xEnd, y), linePaint);
    }

    // ── Bookmark ribbon (right page, gold accent) ────────────────────────
    final bookmarkPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    final bookmarkPath = Path()
      ..moveTo(w * 0.76, h * 0.18)
      ..lineTo(w * 0.86, h * 0.18)
      ..lineTo(w * 0.86, h * 0.52)
      ..lineTo(w * 0.81, h * 0.46)
      ..lineTo(w * 0.76, h * 0.52)
      ..close();
    canvas.drawPath(bookmarkPath, bookmarkPaint);

    // ── Bag handle (gold arc above the book) ────────────────────────────
    final handlePaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.06
      ..strokeCap = StrokeCap.round;

    final handleRect = Rect.fromCenter(
      center: Offset(w * 0.50, h * 0.15),
      width: w * 0.34,
      height: h * 0.18,
    );
    canvas.drawArc(handleRect, 3.14159, 3.14159, false, handlePaint);
  }

  @override
  bool shouldRepaint(_GettyBagLogoPainter oldDelegate) =>
      oldDelegate.primaryColor != primaryColor ||
      oldDelegate.accentColor != accentColor;
}

/// Wordmark widget — renders "GettyBag" with two-tone typography.
/// "Getty" in the primary ink color, "Bag" in the gold accent.
class GettyBagWordmark extends StatelessWidget {
  final double fontSize;
  final Color color;
  final bool showTagline;

  const GettyBagWordmark({
    super.key,
    this.fontSize = 32,
    this.color = AppColors.ink,
    this.showTagline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Getty',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                  color: color,
                  letterSpacing: -0.5,
                ),
              ),
              TextSpan(
                text: 'Bag',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                  color: AppColors.accent,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
        if (showTagline) ...[
          const SizedBox(height: 4),
          Text(
            'Your Literary Marketplace',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: fontSize * 0.38,
              fontWeight: FontWeight.w400,
              color: color.withValues(alpha: 0.70),
              letterSpacing: 0.5,
            ),
          ),
        ],
      ],
    );
  }
}
