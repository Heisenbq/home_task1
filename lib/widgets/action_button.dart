import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Color fontColor;
  final Color backgroundColor;
  const ActionButton({
    super.key,
    required this.text,
    required this.fontColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: fontColor,
            fontWeight: FontWeight.w500,

          ),
        ),
      ),
    );
  }
}