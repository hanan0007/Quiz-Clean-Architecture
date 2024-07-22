import 'package:flutter/material.dart';
import 'package:quiz_clean_archi/infrastructure/theme/color_scheme.dart';

SnackBarThemeData get snackBarTheme => SnackBarThemeData(
      backgroundColor: colorSchemelight.surfaceContainerHighest,
      // Background color of the SnackBar
      actionTextColor: colorSchemelight.primary,
      // Color of the action text
      disabledActionTextColor: colorSchemelight.onSurface.withOpacity(0.38),
      // Color of the action text when it is disabled
      contentTextStyle: TextStyle(
        color: colorSchemelight.onSurface, // Text color inside the SnackBar
        fontSize: 16, // Example size for Body Large
      ),
      elevation: 6.0,
      // Elevation of the SnackBar
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0), // Shape of the SnackBar
      ),
      behavior: SnackBarBehavior.floating,
      // Behavior of the SnackBar
      width: 280.0, // Width of the SnackBar
    );

SnackBarThemeData get darkSnackBarTheme => SnackBarThemeData(
      backgroundColor: colorSchemelDark.surfaceContainerHighest,
      // Background color of the SnackBar
      actionTextColor: colorSchemelDark.primary,
      // Color of the action text
      disabledActionTextColor: colorSchemelDark.onSurface.withOpacity(0.38),
      // Color of the action text when it is disabled
      contentTextStyle: TextStyle(
        color: colorSchemelDark.onSurface, // Text color inside the SnackBar
        fontSize: 16, // Example size for Body Large
      ),
      elevation: 6.0,
      // Elevation of the SnackBar
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0), // Shape of the SnackBar
      ),
      behavior: SnackBarBehavior.floating,
      // Behavior of the SnackBar
      width: 280.0, // Width of the SnackBar
    );
