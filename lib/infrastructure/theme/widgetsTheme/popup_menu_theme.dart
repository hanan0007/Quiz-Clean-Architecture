import 'package:flutter/material.dart';
import 'package:quiz_clean_archi/infrastructure/theme/color_scheme.dart';

PopupMenuThemeData get popupMenuTheme => PopupMenuThemeData(
      color: colorSchemelight.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      textStyle: TextStyle(color: colorSchemelight.onSurface),
// Add other properties as needed
    );

PopupMenuThemeData get darkPopupMenuTheme => PopupMenuThemeData(
      color: colorSchemelDark.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      textStyle: TextStyle(color: colorSchemelDark.onSurface),
// Add other properties as needed
    );
