import 'package:flutter/material.dart';
import 'package:quiz_clean_archi/infrastructure/theme/color_scheme.dart';

IconButtonThemeData get iconButtonTheme => IconButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        // backgroundColor:
        //     WidgetStateProperty.all(colorSchemeLight.secondaryContainer),
        foregroundColor:
            WidgetStateProperty.all(colorSchemelight.onSecondaryContainer),
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
        // elevation: WidgetStateProperty.all(2),
        padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
// Define other properties if needed
      ),
    );

IconButtonThemeData get darkIconButtonTheme => IconButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        // backgroundColor:
        //     WidgetStateProperty.all(colorSchemeDark.secondaryContainer),
        foregroundColor:
            WidgetStateProperty.all(colorSchemelDark.onSecondaryContainer),
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
        // elevation: WidgetStateProperty.all(2),
        padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
// Define other properties if needed
      ),
    );
