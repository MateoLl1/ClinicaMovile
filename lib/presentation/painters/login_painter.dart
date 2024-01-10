import 'package:flutter/material.dart';

class LoginPainter extends CustomPainter {
  final Color color1;
  final Color color2;

  LoginPainter({
    super.repaint, 
    required this.color1,
    required this.color2
  });
  @override
  void paint(Canvas canvas, Size size) {

    final pencil = Paint();
    pencil.color = color1;
    pencil.strokeWidth = 10;
    pencil.style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height*.2);
    path.arcToPoint(
      Offset(size.width*.5, size.height*.3),
      radius: Radius.circular(size.height*.4),
      clockwise: false
    );
    path.arcToPoint(
      Offset(size.width, size.height*.4),
      radius: Radius.circular(size.height*.4),
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, pencil);
    path.reset();
    //* FIGURA2

    // pencil.color = const Color(0xff6886C5);
    pencil.color = color2;
    pencil.style = PaintingStyle.fill;
    path.moveTo(size.width*.2, 0);
    path.arcToPoint(
      Offset(size.width*.6, size.height*.15),
      radius:  Radius.circular(size.width*.6),
      clockwise: false
    );
    path.arcToPoint(
      Offset(size.width, size.height*.4),
      radius:  Radius.circular(size.width/2),
    );
    path.lineTo(size.width, 0);
    path.moveTo(size.width*.3, 0);
    canvas.drawPath(path, pencil);

  }

  @override
  bool shouldRepaint(LoginPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LoginPainter oldDelegate) => false;
}