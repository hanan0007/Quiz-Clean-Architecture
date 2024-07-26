import 'package:flutter/material.dart';
import 'package:quiz_clean_archi/domain/const/text_const.dart';
import 'package:quiz_clean_archi/infrastructure/theme/color_scheme.dart';

AppBarTheme get appbarthemelight => AppBarTheme(
    surfaceTintColor: Colors.transparent,
    color: Colors.transparent,
    iconTheme: IconThemeData(color: colorSchemelight.onSurface),
    actionsIconTheme: IconThemeData(color: colorSchemelight.onPrimary),
    titleTextStyle: TextStyle(
        color: colorSchemelight.onSurface,
        fontSize: AppTextSizes.titleLargeFont),
    toolbarTextStyle: TextStyle(
      color: colorSchemelight.onSurface,
    ));
// dark app bar
AppBarTheme get appbarthemedark => AppBarTheme(
    surfaceTintColor: Colors.transparent,
    color: Colors.transparent,
    iconTheme: IconThemeData(color: colorSchemelDark.onSurface),
    actionsIconTheme: IconThemeData(color: colorSchemelDark.onPrimary),
    titleTextStyle: TextStyle(
        color: colorSchemelDark.onSurface,
        fontSize: AppTextSizes.titleLargeFont),
    toolbarTextStyle: TextStyle(
      color: colorSchemelDark.onSurface,
    ));
