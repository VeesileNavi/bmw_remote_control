import 'package:flutter/material.dart';

class BottomNavigationBarPainter extends CustomPainter{
  Path mainPath = Path();

  @override
  void paint(Canvas canvas, Size size) {
    mainPath.moveTo(0,size.height*0.3846154);
    mainPath.lineTo(size.width*0.04192103,size.height*0.1658974);
    mainPath.cubicTo(size.width*0.06223282,size.height*0.05992192,size.width*0.09031718,0,size.width*0.1196736,0);
    mainPath.lineTo(size.width*0.3187897,0);
    mainPath.cubicTo(size.width*0.3407769,0,size.width*0.3622385,size.height*0.03365282,size.width*0.3802897,size.height*0.09643564);
    mainPath.lineTo(size.width*0.4341077,size.height*0.2836308);
    mainPath.cubicTo(size.width*0.4737154,size.height*0.4213962,size.width*0.5262846,size.height*0.4213962,size.width*0.5658923,size.height*0.2836308);
    mainPath.lineTo(size.width*0.6197103,size.height*0.09643564);
    mainPath.cubicTo(size.width*0.6377615,size.height*0.03365269,size.width*0.6592231,0,size.width*0.6812103,0);
    mainPath.lineTo(size.width*0.8803256,0);
    mainPath.cubicTo(size.width*0.9096821,0,size.width*0.9377667,size.height*0.05992192,size.width*0.9580795,size.height*0.1658974);
    mainPath.lineTo(size.width,size.height*0.3846154);
    mainPath.lineTo(size.width,size.height+16);
    mainPath.lineTo(0,size.height+16);
    mainPath.lineTo(0,size.height);
    mainPath.close();

    Paint bottomBarPainter = Paint()..style=PaintingStyle.fill;
    bottomBarPainter.color = Colors.white.withOpacity(0.4);
    Paint innerShadowPainter = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 5,)
      ..color = Colors.black;
    canvas.drawPath(mainPath,bottomBarPainter);
    canvas.drawPath(mainPath, innerShadowPainter);

  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}