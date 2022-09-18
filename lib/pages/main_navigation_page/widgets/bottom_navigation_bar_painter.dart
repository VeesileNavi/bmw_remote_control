import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    Path mainPaint = Path();
    mainPaint.moveTo(0,size.height*0.3846154);
    mainPaint.lineTo(size.width*0.04192103,size.height*0.1658974);
    mainPaint.cubicTo(size.width*0.06223282,size.height*0.05992192,size.width*0.09031718,0,size.width*0.1196736,0);
    mainPaint.lineTo(size.width*0.3187897,0);
    mainPaint.cubicTo(size.width*0.3407769,0,size.width*0.3622385,size.height*0.03365282,size.width*0.3802897,size.height*0.09643564);
    mainPaint.lineTo(size.width*0.4341077,size.height*0.2836308);
    mainPaint.cubicTo(size.width*0.4737154,size.height*0.4213962,size.width*0.5262846,size.height*0.4213962,size.width*0.5658923,size.height*0.2836308);
    mainPaint.lineTo(size.width*0.6197103,size.height*0.09643564);
    mainPaint.cubicTo(size.width*0.6377615,size.height*0.03365269,size.width*0.6592231,0,size.width*0.6812103,0);
    mainPaint.lineTo(size.width*0.8803256,0);
    mainPaint.cubicTo(size.width*0.9096821,0,size.width*0.9377667,size.height*0.05992192,size.width*0.9580795,size.height*0.1658974);
    mainPaint.lineTo(size.width,size.height*0.3846154);
    mainPaint.lineTo(size.width,size.height+16);
    mainPaint.lineTo(0,size.height+16);
    mainPaint.lineTo(0,size.height);
    mainPaint.close();

    Paint bottomBarPainter = Paint()..style=PaintingStyle.fill;
    bottomBarPainter.color = Colors.white.withOpacity(0.4);
    Paint innerShadowPainter = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 5,)
      ..color = Colors.black;
    canvas.drawPath(mainPaint,bottomBarPainter);
    canvas.drawPath(mainPaint, innerShadowPainter);

  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}