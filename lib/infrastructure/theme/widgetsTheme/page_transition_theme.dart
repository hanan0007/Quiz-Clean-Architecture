import 'package:flutter/material.dart';

PageTransitionsTheme get pageTransitionsTheme => const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
// You can add custom transitions for different platforms
      },
    );

PageTransitionsTheme get darkPageTransitionsTheme => const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
// You can add custom transitions for different platforms
      },
    );
