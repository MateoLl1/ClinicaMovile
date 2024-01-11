import 'package:flutter/material.dart';

class RegisterPainter extends CustomPainter {
  final Color color;
  final Color color2;

  RegisterPainter({
    super.repaint, 
    required this.color,
    required this.color2
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();
    paint.color = color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    paint.color = color2;
    paint.style = PaintingStyle.fill;
    path.moveTo(size.width, 0);
    path.arcToPoint(
      Offset(0, size.height*.22),
      radius: Radius.circular(size.width)
    );
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
    
    
    path.reset();
    paint.color = color;
    paint.style = PaintingStyle.fill;

    path.moveTo(0, size.height*.2);
    path.arcToPoint(
      Offset(size.width*.8, 0),
      radius: Radius.circular(size.width*.7),
      clockwise: false
    );
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);

    
    
  }

  @override
  bool shouldRepaint(RegisterPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(RegisterPainter oldDelegate) => false;
}