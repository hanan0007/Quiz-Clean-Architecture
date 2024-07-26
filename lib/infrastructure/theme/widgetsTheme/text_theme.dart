import 'package:flutter/material.dart';
import 'package:quiz_clean_archi/domain/const/global_const.dart';
import 'package:quiz_clean_archi/domain/const/text_const.dart';
import 'package:quiz_clean_archi/infrastructure/theme/color_scheme.dart';

TextTheme get txtTheme => TextTheme(
      displayLarge: textStyle(colorSchemelight.onPrimary,
          AppTextSizes.displayLargeFont, FontWeight.w300),
      displayMedium: textStyle(colorSchemelight.onPrimary,
          AppTextSizes.displayMediumFont, FontWeight.w300),
      displaySmall: textStyle(colorSchemelight.onPrimary,
          AppTextSizes.displaySmallFont, FontWeight.w400),
      headlineLarge: textStyle(colorSchemelight.onPrimary,
          AppTextSizes.headlineLargeFont, FontWeight.w400),
      headlineMedium: textStyle(colorSchemelight.onPrimary,
          AppTextSizes.headlineMediumFont, FontWeight.w400),
      headlineSmall: textStyle(colorSchemelight.onPrimary,
          AppTextSizes.headlineSmallFont, FontWeight.w400),
      titleLarge: textStyle(colorSchemelight.onPrimary,
          AppTextSizes.titleLargeFont, FontWeight.w500),
      titleMedium: textStyle(colorSchemelight.onPrimary,
          AppTextSizes.titleMediumFont, FontWeight.w400),
      titleSmall: textStyle(colorSchemelight.onPrimary,
          AppTextSizes.titleSmallFont, FontWeight.w500),
      bodyLarge: textStyle(colorSchemelight.onSurface,
          AppTextSizes.bodyLargeFont, FontWeight.w400),
      bodyMedium: textStyle(colorSchemelight.onSurface,
          AppTextSizes.bodyMediumFont, FontWeight.w400),
      bodySmall: textStyle(colorSchemelight.onSurface,
          AppTextSizes.bodySmallFont, FontWeight.w400),
      labelLarge: textStyle(colorSchemelight.onPrimary,
          AppTextSizes.labelLargeFont, FontWeight.w500),
      labelMedium: textStyle(colorSchemelight.onPrimary,
          AppTextSizes.labelMediumFont, FontWeight.w500),
      labelSmall: textStyle(colorSchemelight.onSurface,
          AppTextSizes.labelSmallFont, FontWeight.w400),
    );

TextTheme get darkTxtTheme => TextTheme(
      displayLarge: textStyle(colorSchemelDark.onPrimary,
          AppTextSizes.displayLargeFont, FontWeight.w300),
      displayMedium: textStyle(colorSchemelDark.onPrimary,
          AppTextSizes.displayMediumFont, FontWeight.w300),
      displaySmall: textStyle(colorSchemelDark.onPrimary,
          AppTextSizes.displaySmallFont, FontWeight.w400),
      headlineLarge: textStyle(colorSchemelDark.onPrimary,
          AppTextSizes.headlineLargeFont, FontWeight.w400),
      headlineMedium: textStyle(colorSchemelDark.onPrimary,
          AppTextSizes.headlineMediumFont, FontWeight.w400),
      headlineSmall: textStyle(colorSchemelDark.onPrimary,
          AppTextSizes.headlineSmallFont, FontWeight.w400),
      titleLarge: textStyle(colorSchemelDark.onPrimary,
          AppTextSizes.titleLargeFont, FontWeight.w500),
      titleMedium: textStyle(colorSchemelDark.onPrimary,
          AppTextSizes.titleMediumFont, FontWeight.w400),
      titleSmall: textStyle(colorSchemelDark.onPrimary,
          AppTextSizes.titleSmallFont, FontWeight.w500),
      bodyLarge: textStyle(colorSchemelDark.onSurface,
          AppTextSizes.bodyLargeFont, FontWeight.w400),
      bodyMedium: textStyle(colorSchemelDark.onSurface,
          AppTextSizes.bodyMediumFont, FontWeight.w400),
      bodySmall: textStyle(colorSchemelDark.onSurface,
          AppTextSizes.bodySmallFont, FontWeight.w400),
      labelLarge: textStyle(colorSchemelDark.onPrimary,
          AppTextSizes.labelLargeFont, FontWeight.w500),
      labelMedium: textStyle(colorSchemelDark.onPrimary,
          AppTextSizes.labelMediumFont, FontWeight.w500),
      labelSmall: textStyle(colorSchemelDark.onSurface,
          AppTextSizes.labelSmallFont, FontWeight.w400),
    );

TextStyle textStyle(Color color, double fontSize, FontWeight fontWeight) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: appFontFamily,
      fontWeight: fontWeight);
}

// TextTheme get txtTheme => TextTheme(
//       displayLarge: TextStyle(
//           color: colorSchemelight.onPrimary,
//           fontSize: AppTextSizess.displayLargeFont,
//           fontWeight: FontWeight.w300),
//       displayMedium: TextStyle(
//           color: colorSchemelight.onPrimary,
//           fontSize: AppTextSizess.displayMediumFont,
//           fontWeight: FontWeight.w300),
//       displaySmall: TextStyle(
//           color: colorSchemelight.onPrimary,
//           fontSize: AppTextSizess.displaySmallFont,
//           fontWeight: FontWeight.w400),
//       headlineLarge: TextStyle(
//           color: colorSchemelight.onPrimary,
//           fontSize: AppTextSizess.headlineLargeFont,
//           fontWeight: FontWeight.w400),
//       headlineMedium: TextStyle(
//           color: colorSchemelight.onPrimary,
//           fontSize: AppTextSizess.headlineMediumFont,
//           fontWeight: FontWeight.w400),
//       headlineSmall: TextStyle(
//           color: colorSchemelight.onPrimary,
//           fontSize: AppTextSizess.headlineSmallFont,
//           fontWeight: FontWeight.w400),
//       titleLarge: TextStyle(
//           color: colorSchemelight.onPrimary,
//           fontSize: AppTextSizess.titleLargeFont,
//           fontWeight: FontWeight.w500),
//       titleMedium: TextStyle(
//           color: colorSchemelight.onPrimary,
//           fontSize: AppTextSizess.titleMediumFont,
//           fontWeight: FontWeight.w400),
//       titleSmall: TextStyle(
//           color: colorSchemelight.onPrimary,
//           fontSize: AppTextSizess.titleSmallFont,
//           fontWeight: FontWeight.w500),
//       bodyLarge: TextStyle(
//           color: colorSchemelight.onSurface,
//           fontSize: AppTextSizess.bodyLargeFont,
//           fontWeight: FontWeight.w400),
//       bodyMedium: TextStyle(
//           color: colorSchemelight.onSurface,
//           fontSize: AppTextSizess.bodyMediumFont,
//           fontWeight: FontWeight.w400),
//       bodySmall: TextStyle(
//           color: colorSchemelight.onSurface,
//           fontSize: AppTextSizess.bodySmallFont,
//           fontWeight: FontWeight.w400),
//       labelLarge: TextStyle(
//           color: colorSchemelight.onPrimary,
//           fontSize: AppTextSizess.labelLargeFont,
//           fontWeight: FontWeight.w500),
//       labelMedium: TextStyle(
//           color: colorSchemelight.onPrimary,
//           fontSize: AppTextSizess.labelMediumFont,
//           fontWeight: FontWeight.w500),
//       labelSmall: TextStyle(
//           color: colorSchemelight.onSurface,
//           fontSize: AppTextSizess.labelSmallFont,
//           fontWeight: FontWeight.w400),
//     );
//
// TextTheme get darkTxtTheme => TextTheme(
//       displayLarge: TextStyle(
//           color: colorSchemelDark.onPrimary,
//           fontSize: AppTextSizess.displayLargeFont,
//           fontWeight: FontWeight.w300),
//       displayMedium: TextStyle(
//           color: colorSchemelDark.onPrimary,
//           fontSize: AppTextSizess.displayMediumFont,
//           fontWeight: FontWeight.w300),
//       displaySmall: TextStyle(
//           color: colorSchemelDark.onPrimary,
//           fontSize: AppTextSizess.displaySmallFont,
//           fontWeight: FontWeight.w400),
//       headlineLarge: TextStyle(
//           color: colorSchemelDark.onPrimary,
//           fontSize: AppTextSizess.headlineLargeFont,
//           fontWeight: FontWeight.w400),
//       headlineMedium: TextStyle(
//           color: colorSchemelDark.onPrimary,
//           fontSize: AppTextSizess.headlineMediumFont,
//           fontWeight: FontWeight.w400),
//       headlineSmall: TextStyle(
//           color: colorSchemelDark.onPrimary,
//           fontSize: AppTextSizess.headlineSmallFont,
//           fontWeight: FontWeight.w400),
//       titleLarge: TextStyle(
//           color: colorSchemelDark.onPrimary,
//           fontSize: AppTextSizess.titleLargeFont,
//           fontWeight: FontWeight.w500),
//       titleMedium: TextStyle(
//           color: colorSchemelDark.onPrimary,
//           fontSize: AppTextSizess.titleMediumFont,
//           fontWeight: FontWeight.w400),
//       titleSmall: TextStyle(
//           color: colorSchemelDark.onPrimary,
//           fontSize: AppTextSizess.titleSmallFont,
//           fontWeight: FontWeight.w500),
//       bodyLarge: TextStyle(
//           color: colorSchemelDark.onSurface,
//           fontSize: AppTextSizess.bodyLargeFont,
//           fontWeight: FontWeight.w400),
//       bodyMedium: TextStyle(
//           color: colorSchemelDark.onSurface,
//           fontSize: AppTextSizess.bodyMediumFont,
//           fontWeight: FontWeight.w400),
//       bodySmall: TextStyle(
//           color: colorSchemelDark.onSurface,
//           fontSize: AppTextSizess.bodySmallFont,
//           fontWeight: FontWeight.w400),
//       labelLarge: TextStyle(
//           color: colorSchemelDark.onPrimary,
//           fontSize: AppTextSizess.labelLargeFont,
//           fontWeight: FontWeight.w500),
//       labelMedium: TextStyle(
//           color: colorSchemelDark.onPrimary,
//           fontSize: AppTextSizess.labelMediumFont,
//           fontWeight: FontWeight.w500),
//       labelSmall: TextStyle(
//           color: colorSchemelDark.onSurface,
//           fontSize: AppTextSizess.labelSmallFont,
//           fontWeight: FontWeight.w400),
//     );
