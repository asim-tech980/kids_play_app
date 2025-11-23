import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kids_app_admin_panel/resources/resources.dart';

class AppDecoration {
  InputDecoration fieldDecoration({
    Widget? preIcon,
    required String hintText,
    String? labelText,
    Widget? suffixIcon,
    double? radius,
    double? horizontalPadding,
    double? verticalPadding,
    double? iconMinWidth,
    Color? fillColor,
    Color? borderColor,
    FocusNode? focusNode,
    TextStyle? hintTextStyle,
    double? hintFontSize,
    bool? hideCounter,
  }) {
    return InputDecoration(
      counterText: hideCounter == true ? "" : null,
      prefixIconConstraints: BoxConstraints(minWidth: iconMinWidth ?? 42),
      suffixIconConstraints: BoxConstraints(minWidth: iconMinWidth ?? 42),
      contentPadding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 16,
        vertical: verticalPadding ?? (kIsWeb == true ? 16 : 11),
      ),
      fillColor: fillColor ?? R.colors.fillColor,
      hintText: hintText,
      hintStyle:
          hintTextStyle ??
          R.textStyles.poppins(
            color: R.colors.hintTextColor.withValues(alpha: .8),
            fontSize: hintFontSize ?? R.fontsizes.b2,
          ),
      errorMaxLines: 2,
      errorStyle: R.textStyles.poppins(
        fontSize: R.fontsizes.t9,
        color: R.colors.red,
      ),
      labelText: labelText,
      labelStyle: TextStyle(
        color: R.colors.white,
        fontFamily: "Visby CF",
        fontSize: hintFontSize ?? R.fontsizes.b2,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: preIcon,
      suffixIcon: suffixIcon != null ? Container(child: suffixIcon) : null,
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: borderColor ?? R.colors.fillColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: borderColor ?? R.colors.fillColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
        borderSide: BorderSide(color: borderColor ?? R.colors.fillColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: borderColor ?? R.colors.fillColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.red),
      ),
      filled: true,
    );
  }

  InputDecoration fieldBorderDecoration({
    Widget? preIcon,
    required String hintText,
    String? labelText,
    Widget? suffixIcon,
    double? radius,
    double? horizontalPadding,
    double? hintFontSize,
    double? verticalPadding,
    double? iconMinWidth,
    Color? fillColor,
    Color? borderColor,
    Color? hintColor,
    FontWeight? hintFontWeight,
    FocusNode? focusNode,
    TextStyle? hintTextStyle,
  }) {
    return InputDecoration(
      // counterText: '',
      prefixIconConstraints: BoxConstraints(minWidth: iconMinWidth ?? 42),
      suffixIconConstraints: BoxConstraints(minWidth: iconMinWidth ?? 42),
      contentPadding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 16,
        vertical: verticalPadding ?? 10,
      ),
      fillColor: fillColor ?? R.colors.fillColor,
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(
        color: R.colors.black,
        fontFamily: "Visby CF",
        fontSize: R.fontsizes.b2,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: preIcon,
      suffixIcon: suffixIcon != null ? Container(child: suffixIcon) : null,
      hintStyle:
          hintTextStyle ??
          TextStyle(
            fontFamily: 'poppins',
            fontSize: hintFontSize ?? 14,
            color: hintColor ?? R.colors.primaryTextColor,
            fontWeight: hintFontWeight ?? FontWeight.normal,
          ),
      errorStyle: R.textStyles.poppins(fontSize: R.fontsizes.t7),
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: borderColor ?? R.colors.fillColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: borderColor ?? R.colors.fillColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: borderColor ?? R.colors.fillColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: borderColor ?? R.colors.fillColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.red),
      ),
      filled: true,
    );
  }

  BoxDecoration boxDecoration({
    double? radius,
    bool boxShadow = false,
    bool boxShadowInverse = false,
    Color? color,
    Color? borderColor,
  }) {
    return BoxDecoration(
      border: Border.all(color: borderColor ?? R.colors.transparent),
      borderRadius: BorderRadius.circular(radius ?? 24),
      color: color ?? R.colors.white,
      boxShadow: boxShadow
          ? [
              BoxShadow(
                color: R.colors.black.withOpacity(0.09),
                offset: const Offset(2, 2),
                blurRadius: 4.0,
              ),
              if (boxShadowInverse)
                BoxShadow(
                  color: R.colors.black.withOpacity(0.09),
                  offset: const Offset(-2, -2),
                  blurRadius: 4.0,
                ),
            ]
          : null,
    );
  }

  BoxDecoration boxDecorationCircular({double? radius, Color? color}) {
    return BoxDecoration(
      color: color ?? R.colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius ?? 30),
        topRight: Radius.circular(radius ?? 30),
      ),
    );
  }

  InputDecoration fieldDecorationWeb({
    Widget? preIcon,
    required String hintText,
    String? labelText,
    Widget? suffixIcon,
    double? radius,
    double? horizontalPadding,
    double? verticalPadding,
    double? iconMinWidth,
    Color? fillColor,
    Color? borderColor,
    FocusNode? focusNode,
    TextStyle? hintTextStyle,
    double? hintFontSize,
    bool? hideCounter,
  }) {
    return InputDecoration(
      counterText: hideCounter == true ? "" : null,
      prefixIconConstraints: BoxConstraints(minWidth: iconMinWidth ?? 42),
      suffixIconConstraints: BoxConstraints(minWidth: iconMinWidth ?? 42),
      contentPadding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 16,
        vertical: verticalPadding ?? (kIsWeb == true ? 12 : 14),
      ),
      fillColor: fillColor ?? R.colors.fillColor,
      hintText: hintText,
      hintStyle:
          hintTextStyle ??
          R.textStyles.poppins(
            color: R.colors.secondaryTextColor,
            fontSize: hintFontSize ?? R.fontsizes.b2,
          ),
      errorMaxLines: 2,
      errorStyle: R.textStyles.poppins(fontSize: R.fontsizes.t7),
      labelText: labelText,
      labelStyle: TextStyle(
        color: R.colors.white,
        fontFamily: "Visby CF",
        fontSize: R.fontsizes.b2,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: preIcon,
      suffixIcon: suffixIcon != null ? Container(child: suffixIcon) : null,
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: borderColor ?? R.colors.fillColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.fillColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
        borderSide: BorderSide(color: R.colors.fillColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.fillColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.red),
      ),
      filled: true,
    );
  }

  // InputDecoration fieldDecorationMethod({
  //   Widget? preIcon,
  //   required String hintText,
  //   String? labelText,
  //   Widget? suffixIcon,
  //   double? radius,
  //   double? horizontalPadding,
  //   double? verticalPadding,
  //   double? iconMinWidth,
  //   Color? fillColor,
  //   Color? borderColor,
  //   FocusNode? focusNode,
  //   TextStyle? hintTextStyle,
  //   double? hintFontSize,
  //   bool? hideCounter,
  // }) {
  //   return InputDecoration(
  //     counterText: hideCounter == true ? "" : null,
  //     prefixIconConstraints: BoxConstraints(minWidth: iconMinWidth ?? 42),
  //     suffixIconConstraints: BoxConstraints(minWidth: iconMinWidth ?? 42),
  //     contentPadding: EdgeInsets.symmetric(
  //       horizontal: horizontalPadding ?? 16,
  //       vertical: verticalPadding ?? (kIsWeb == true ? 12 : 14),
  //     ),
  //     fillColor: fillColor ?? R.colors.fillColor,
  //     hintText: hintText,
  //     hintStyle:
  //         hintTextStyle ??
  //         R.textStyles.poppins(
  //           color: R.colors.secondaryTextColor,
  //           fontSize: hintFontSize ?? R.fontsizes.b2,
  //         ),
  //     errorMaxLines: 2,
  //     errorStyle: R.textStyles.poppins(fontSize: R.fontsizes.t7),
  //     labelText: labelText,
  //     labelStyle: TextStyle(
  //       color: R.colors.white,
  //       fontFamily: "Visby CF",
  //       fontSize: R.fontsizes.b2,
  //       fontWeight: FontWeight.w400,
  //     ),
  //     prefixIcon: preIcon,
  //     suffixIcon: suffixIcon != null ? Container(child: suffixIcon) : null,
  //     isDense: true,
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
  //       borderSide: BorderSide(color: borderColor ?? R.colors.fillColor),
  //     ),
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
  //       borderSide: BorderSide(color: R.colors.fillColor),
  //     ),
  //     disabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
  //       borderSide: BorderSide(color: R.colors.fillColor),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
  //       borderSide: BorderSide(color: R.colors.fillColor),
  //     ),
  //     errorBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
  //       borderSide: BorderSide(color: R.colors.red),
  //     ),
  //     focusedErrorBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
  //       borderSide: BorderSide(color: R.colors.red),
  //     ),
  //     filled: true,
  //   );
  // }

  InputDecoration searchFieldBorderDecoration({
    Widget? preIcon,
    required String hintText,
    String? labelText,
    Widget? suffixIcon,
    double? radius,
    double? horizontalPadding,
    double? hintFontSize,
    double? verticalPadding,
    double? iconMinWidth,
    Color? fillColor,
    Color? borderColor,
    Color? hintColor,
    FontWeight? hintFontWeight,
    FocusNode? focusNode,
    TextStyle? hintTextStyle,
  }) {
    return InputDecoration(
      prefixIconConstraints: BoxConstraints(minWidth: iconMinWidth ?? 42),
      suffixIconConstraints: BoxConstraints(minWidth: iconMinWidth ?? 42),
      contentPadding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 16,
        vertical: verticalPadding ?? 10,
      ),
      fillColor: fillColor ?? R.colors.white,
      hintText: hintText,
      labelText: labelText,
      labelStyle: R.textStyles.poppins(
        color: R.colors.subHeadings,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: preIcon,
      suffixIcon: suffixIcon != null ? Container(child: suffixIcon) : null,
      hintStyle:
          hintTextStyle ??
          R.textStyles.poppins(
            fontSize: hintFontSize ?? 12,
            color: hintColor ?? R.colors.subHeadings,
            fontWeight: hintFontWeight ?? FontWeight.w400,
          ),
      errorStyle: R.textStyles.poppins(fontSize: 10),
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(
          color: borderColor ?? R.colors.searchBorderColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(
          color: borderColor ?? R.colors.searchBorderColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(
          color: borderColor ?? R.colors.searchBorderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(
          color: borderColor ?? R.colors.searchBorderColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.red),
      ),
      filled: true,
    );
  }
}
