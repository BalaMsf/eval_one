import 'dart:math' as math;

import 'package:flutter/material.dart';

class CircleWidget extends CustomPainter {
  double piValue = math.pi; //3.14 degree-180

  CircleWidget({
    required this.inputValue,
  });

  int inputValue = 0;
  var minValue = 5;
  var maxValue = 35;

  double degreeToRadian(double degree) {
    return degree * piValue / 180;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var archAngle = piValue / 6;
    var gapAngle = degreeToRadian(3);

    var paint1 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    ///red points
    //draw arc of 180 to 210 degree
    var startAngel180 = piValue;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width, //radians
          height: size.height, //radians
        ),
        startAngel180, //radians
        archAngle - gapAngle, //radians
        false,
        paint1);

    //draw arc of 210 to 240 degree
    var startAngel210 = (7 * piValue) / 6;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        startAngel210, //radians
        (archAngle - gapAngle), //radians
        false,
        paint1);

    //draw arc of 240 to 270 degree
    var startAngel240 = (4 * piValue) / 3;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        startAngel240, //radians
        (archAngle - gapAngle), //radians
        false,
        paint1);

    /// green parts

    var paint2 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    //draw arc of 270 to 300 degree
    var startAngel270 = (3 * piValue) / 2;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        startAngel270, //radians
        (archAngle - gapAngle), //radians
        false,
        paint2);

    //draw arc of 300 to 330 degree
    var startAngel300 = (5 * piValue) / 3;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        startAngel300, //radians
        (archAngle - gapAngle), //radians
        false,
        paint2);

    //draw arc of 330 to 360 degree
    var startAngel330 = (11 * piValue) / 6;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        startAngel330, //radians
        (archAngle), //radians
        false,
        paint2);

    // Draw the pivot circle.
    Paint pivotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      6,
      pivotPaint,
    );

    // compass dsign.
    var circleRadius = size.width / 2;
    var compassLength = (circleRadius) * 0.9;

    if (inputValue < minValue) inputValue = minValue;

    if (inputValue > maxValue) inputValue = maxValue;

    var degreeVal = ((inputValue - minValue) * piValue) / (maxValue - minValue);

    var compassEndX = circleRadius - (compassLength * math.cos(degreeVal));
    var compassEndY = circleRadius - (compassLength * math.sin(degreeVal));

    Paint compassPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawLine(
      Offset(size.width / 2, size.height / 2),
      Offset(compassEndX, compassEndY),
      compassPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
