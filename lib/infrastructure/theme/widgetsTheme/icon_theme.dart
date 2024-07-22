import 'package:flutter/material.dart';
import 'package:quiz_clean_archi/infrastructure/theme/color_scheme.dart';

IconThemeData get iconThemeData => IconThemeData(
    color:
        colorSchemelight.onPrimary // Use the onPrimary color for AppBar icons
    );

IconThemeData get darkIconThemeData => IconThemeData(
    color:
        colorSchemelDark.onPrimary // Use the onPrimary color for AppBar icons
    );
