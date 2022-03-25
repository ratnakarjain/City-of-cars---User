import 'package:flutter/material.dart';

class RRecctButton extends StatelessWidget {
  Color? buttonColor;
  double? h;
  double? w;
  String text;
  TextStyle? style;
  void Function()? onTap;
  RRecctButton(
      {Key? key,
      required this.text,
      this.buttonColor,
      this.h,
      this.style,
      this.w,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(h! / 2),
      onTap: onTap,
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(h! / 2), color: buttonColor),
        child: Center(
          child: Text(text, style: style),
        ),
      ),
    );
  }
}

class RRecctButton2 extends StatelessWidget {
  Color? buttonColor;
  double? h;
  double? w;
  double? radius;
  Widget widget;
  
  void Function()? onTap;
  RRecctButton2(
      {Key? key,
      required this.widget,
      this.radius,
      this.buttonColor,
      this.h,
      
      this.w,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius!),
      onTap: onTap,
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(h! / 2), color: buttonColor),
        child:widget
     
      ),
    );
  }
}
