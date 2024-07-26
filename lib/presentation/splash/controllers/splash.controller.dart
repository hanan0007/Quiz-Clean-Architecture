import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_clean_archi/domain/core/usecase/splash_usecase/firebasemsg_usecase.dart';
import 'package:quiz_clean_archi/domain/core/usecase/splash_usecase/gettoken_usecase.dart';
import 'package:quiz_clean_archi/infrastructure/navigation/routes.dart';

class SplashController extends GetxController {
  final FireBaseMsgUsecase firebasemsgUsecase;
  final GettokenUsecase gettokenUsecase;
  SplashController(this.firebasemsgUsecase, this.gettokenUsecase);
  @override
  onInit() async {
    super.onInit();
    started();
  }

  started() async {
    try {
      GetStorage getStorage = GetStorage();
      final isLogin = getStorage.read("name");
      await firebasemsgUsecase.execute();
      gettokenUsecase.execute();
      Future.delayed(const Duration(seconds: 2), () {
        if (isLogin != null) {
          Get.toNamed(Routes.DASHBOARD);
        } else {
          Get.toNamed(Routes.LOGIN);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  double getHeight(context) {
    return MediaQuery.sizeOf(context).height;
  }
}
