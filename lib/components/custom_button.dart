import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

// Common Button //
class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      required this.buttonColor,
      required this.buttonSize,
      required this.fontSize});

  String buttonText;
  Color buttonColor;
  double? buttonSize;
  double? fontSize;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSize,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(buttonColor),
              shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              buttonText,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize),
            ),
          )),
    );
  }
}

// Clickable Text //
class CustomClickableText extends StatelessWidget {
  CustomClickableText(
      {super.key,
      required this.text,
      required this.textColor,
      required this.onTap,
      required this.fontSize});

  String text;
  Color textColor;
  VoidCallback onTap;
  double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: GoogleFonts.poppins(
            color: textColor, fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Image Icon Button //
class AnotherLoginButton extends StatelessWidget {
  AnotherLoginButton({super.key, required this.image, required this.onTap});

  String image;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(7),
        width: mediaQuery.width / 8,
        height: mediaQuery.width / 8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(3, 4),
              )
            ]),
        child: Image.asset(image),
      ),
    );
  }
}
