import 'package:flutter/material.dart';

class RRectCard extends StatelessWidget {
  final double h;
  final double w;
  bool istext;
  String? text = "";
  String image;
  TextStyle? textStyle = const TextStyle();
  Color? color;

  RRectCard(
      {Key? key,
      required this.h,
      required this.w,
      this.text,
      required this.istext,
      this.textStyle,
      required this.image,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 8,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Container(
        height: h,
        width: w,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(image),
          const SizedBox(
            height: 5,
          ),
          istext
              ? FittedBox(
                child: Text(
                    text!,
                    style: textStyle,
                  ),
              )
              : Container()
        ]),
      ),
    );
  }
}
