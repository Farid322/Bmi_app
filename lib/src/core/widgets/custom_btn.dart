import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
   VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;

   CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.height,
    this.width,
    this.textStyle,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.black,
            borderRadius: borderRadius ?? BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
             style: TextStyle(color: Colors.white,fontWeight:FontWeight.w500,fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
