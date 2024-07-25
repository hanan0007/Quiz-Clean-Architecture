import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/core/usecase/splash_usecase/firebasemsg_usecase.dart';
import 'package:quiz_clean_archi/domain/core/usecase/splash_usecase/gettoken_usecase.dart';
import 'package:quiz_clean_archi/infrastructure/navigation/routes.dart';

class SplashController extends GetxController {
  final FireBaseMsgUsecase firebasemsgUsecase;
  final GettokenUsecase gettokenUsecase;
  SplashController(this.firebasemsgUsecase, this.gettokenUsecase);
  @override
  onInit() async {
    // TODO: implement onInit
    super.onInit();
    started();
  }

  started() async {
    try {
      await firebasemsgUsecase.execute();
      gettokenUsecase.execute();
      Future.delayed(Duration(seconds: 2), () {
        Get.toNamed(Routes.HOME);
      });
    } catch (e) {
      print(e);
    }
  }

  double getHeight(context) {
    return MediaQuery.sizeOf(context).height;
  }
}
