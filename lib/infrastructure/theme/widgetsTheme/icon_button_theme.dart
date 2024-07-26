import 'package:flutter/material.dart';
import 'package:quiz_clean_archi/infrastructure/theme/color_scheme.dart';

IconButtonThemeData get iconButtonTheme => IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all(colorSchemelight.secondaryContainer),
        splashFactory: InkRipple.splashFactory,
        foregroundColor: WidgetStateProperty.all(Colors.white),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return colorSchemelight.secondary.withOpacity(0.3);
            }
            if (states.contains(WidgetState.hovered)) {
              return colorSchemelight.secondary.withOpacity(0.08);
            }
            return null; // Defer to the widget's default.
          },
        ),
        shadowColor: WidgetStateProperty.all(colorSchemelight.shadow),
        padding:
            WidgetStateProperty.all(const EdgeInsets.all(8)), // Adjust padding
        minimumSize:
            WidgetStateProperty.all(const Size(48, 48)), // Ensure minimum size
        shape: WidgetStateProperty.all(
            const CircleBorder()), // Use CircleBorder for round shape
        alignment: Alignment.center, // Center the icon
      ),
    );

IconButtonThemeData get darkIconButtonTheme => IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all(colorSchemelDark.secondaryContainer),
        splashFactory: InkRipple.splashFactory,
        foregroundColor: WidgetStateProperty.all(Colors.black),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return colorSchemelDark.secondary.withOpacity(0.3);
            }
            if (states.contains(WidgetState.hovered)) {
              return colorSchemelDark.secondary.withOpacity(0.08);
            }
            return null; // Defer to the widget's default.
          },
        ),
        shadowColor: WidgetStateProperty.all(colorSchemelDark.shadow),
        padding:
            WidgetStateProperty.all(const EdgeInsets.all(8)), // Adjust padding
        minimumSize:
            WidgetStateProperty.all(Size(48, 48)), // Ensure minimum size
        shape: WidgetStateProperty.all(
            const CircleBorder()), // Use CircleBorder for round shape
        alignment: Alignment.center, // Center the icon
      ),
    );
