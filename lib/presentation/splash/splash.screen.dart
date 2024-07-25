import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/const/global_const.dart';

import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final widht = MediaQuery.sizeOf(context).width;
    controller.onInit();
    return Scaffold(
      body: SizedBox(
        height: height,
        width: widht,
        // color: AppColors.primaryFromTheme(context),
        // color: Theme.of(context).brightness == Brightness.light
        //     ? Colors.white
        //     : Colors.blueGrey[800],
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              SizedBox(
                  width: widht * 0.4,
                  child: Image.asset('assets/images/app_logo.png')),
              SizedBox(
                  width: widht * 0.4,
                  child: Image.asset('assets/images/app_name.png')),
              SizedBox(
                height: height * 0.35,
              ),
              SpinKitFadingCircle(
                color: colorScheme(context).secondary,
                size: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
