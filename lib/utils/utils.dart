import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  static horizontalSpacing({double space = 8}) => SizedBox(
        width: space,
      );

  static verticalSpacing({double space = 8}) => SizedBox(
        height: space,
      );

  //title text,
  static titleText(String text, {Color? color, double? fontSize, TextAlign? align}) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 24,
        fontWeight: FontWeight.w600
      ),
      textAlign: align ?? TextAlign.left,
    );
  }
  //header text,
  static headerText(String text, {Color? color, double? fontSize, TextAlign? align}) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 32,
        fontWeight: FontWeight.w600
      ),
      textAlign: align ?? TextAlign.left,
    );
  }
  //regular text,
  static regularText(String text, {Color? color, double? fontSize, TextAlign? align}) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w500
      ),
      textAlign: align ?? TextAlign.left,
    );
  }
  //caption text
  static captionText(String text, {Color? color, double? fontSize, TextAlign? align}) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.w400
      ),
      textAlign: align ?? TextAlign.left,
    );
  }

// Suggested code may be subject to a license. Learn more: ~LicenseLog:3372908910.
  static showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
