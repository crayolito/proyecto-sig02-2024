import 'package:flutter/material.dart';

class MarkerPersonalized extends CustomPainter {
  final String namePasillo;
  MarkerPersonalized({required this.namePasillo}) : super();

  @override
  void paint(Canvas canvas, Size size) {
    final blackPaint = Paint()..color = Colors.black;
    final whitePaint = Paint()..color = Colors.white;

    //Dibujar caja blanca
    final pathCB = Path();
    pathCB.moveTo(0, 0);
    pathCB.lineTo(size.width, 0);
    pathCB.lineTo(size.width, size.height);
    pathCB.lineTo(0, size.height);
    canvas.drawPath(pathCB, blackPaint);

    //Dibujar caja blanca
    final pathCW = Path();
    double valorMCW = 6;
    pathCW.moveTo(valorMCW, valorMCW);
    pathCW.lineTo(size.width - valorMCW, valorMCW);
    pathCW.lineTo(size.width - valorMCW, size.height - valorMCW);
    pathCW.lineTo(valorMCW, size.height - valorMCW);
    canvas.drawPath(pathCW, whitePaint);

    final textSpan = TextSpan(
      text: namePasillo,
      style: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(minWidth: 200, maxWidth: 200);

    textPainter.paint(canvas, Offset(0, size.height / 3.5));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
