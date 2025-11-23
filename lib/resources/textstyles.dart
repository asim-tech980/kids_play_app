import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_app_admin_panel/resources/resources.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {
  TextStyle poppins({
    BuildContext? context,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.poppins(
      fontSize: AdaptiveTextSize.getAdaptiveTextSize(fontSize ?? 12),
      color: color ?? R.colors.primaryColor,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: letterSpacing ?? 0.3,
    );
  }

  TextStyle nunito({
    BuildContext? context,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.nunito(
      fontSize: AdaptiveTextSize.getAdaptiveTextSize(fontSize ?? 12),
      color: color ?? R.colors.primaryColor,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: letterSpacing ?? 0.48,
    );
  }
}

class AdaptiveTextSize {
  const AdaptiveTextSize();

  static getAdaptiveTextSize(double value) {
    if (kIsWeb) {
      return (value);
    } else {
      return (value).sp;
    }
  }
}
