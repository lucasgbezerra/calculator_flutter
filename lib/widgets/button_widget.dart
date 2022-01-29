import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Function() onPressed;
  const ButtonWidget(
      {Key? key,
      this.text,
      this.backgroundColor,
      this.textColor,
      required this.onPressed,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.montserrat(
      color: textColor,
      fontSize: 20,
    );

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        elevation: 4,
      ),
      child: icon != null
          ? Icon(
              icon,
              color: textColor,
              size: 20,
            )
          : Text(
              text!,
              style: textStyle,
            ),
      onPressed: onPressed,
    );
  }
}
