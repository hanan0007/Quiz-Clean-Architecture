import 'package:flutter/material.dart';
import 'package:quiz_clean_archi/infrastructure/theme/color_scheme.dart';

CardTheme get cardTheme => CardTheme(
      color: colorSchemelight
          .surface, // Use the surface color for card backgrounds
      shadowColor:
          colorSchemelight.shadow, // Use the shadow color for card shadows
      elevation: 1.0, // Example elevation, adjust as needed
      shape: RoundedRectangleBorder(
// Example shape, adjust as needed
        borderRadius: BorderRadius.circular(4.0),
      ),
// You can add other properties as needed
    );

CardTheme get darkCardTheme => CardTheme(
      color: colorSchemelDark
          .surface, // Use the surface color for card backgrounds
      shadowColor:
          colorSchemelDark.shadow, // Use the shadow color for card shadows
      elevation: 1.0, // Example elevation, adjust as needed
      shape: RoundedRectangleBorder(
// Example shape, adjust as needed
        borderRadius: BorderRadius.circular(4.0),
      ),
// You can add other properties as needed
    );
