import 'package:flutter/material.dart';
import 'package:quiz_clean_archi/infrastructure/theme/color_scheme.dart';

DrawerThemeData get drawerTheme => DrawerThemeData(
      backgroundColor: colorSchemelight
          .surface, // Use the surface color for Drawer background
      scrimColor:
          colorSchemelight.scrim, // Use the scrim color when the Drawer is open
      elevation: 16.0, // Example elevation, adjust as needed
      shape: const RoundedRectangleBorder(
// Example shape, adjust as needed
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
// You can add other properties as needed
    );

DrawerThemeData get darkDrawerTheme => DrawerThemeData(
      backgroundColor: colorSchemelDark
          .surface, // Use the surface color for Drawer background
      scrimColor:
          colorSchemelDark.scrim, // Use the scrim color when the Drawer is open
      elevation: 16.0, // Example elevation, adjust as needed
      shape: const RoundedRectangleBorder(
// Example shape, adjust as needed
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
// You can add other properties as needed
    );
