import 'package:flutter/material.dart';

class RRectCard extends StatelessWidget {
  final double h;
  final double w;
  double borderRadius;
  Color? color;
        Widget widget;


  RRectCard(
      {Key? key,
      required this.h,
      required this.w,
      required this.widget,
      required this.borderRadius,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      elevation: 8,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Container(
        height: h,
        width: w,
        child: 
        widget
      ),
    );
  }
}

class Label extends StatelessWidget {
  String text;
  TextStyle textStyle;
  Color color;
  EdgeInsetsGeometry padding;
  Label({ Key? key , required this.text, required this.textStyle, required this.padding, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: padding,
      child: Text(
        text.toUpperCase(),
        style: textStyle,
      ),
    );
  }
}