import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/core/usecase/leaderboard_usecase/topuser_usecase.dart';

class LeaderboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final TopuserUsecase topuserUsecase;
  LeaderboardController(this.topuserUsecase);
  var topUsers = <Map<String, dynamic>>[].obs;
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;
//top user
  Future<void> topuser() async {
    try {
      var data =
          await topuserUsecase.execute().timeout(const Duration(seconds: 5));

      topUsers.value = data;
    } on TimeoutException catch (_) {
      Get.snackbar(
          'Timeout', 'Please check your internet connection and try again.',
          colorText: Colors.white, snackPosition: SnackPosition.TOP);
    } catch (e) {
      // Handle other exceptions
      Get.snackbar('Error', '$e',
          colorText: Colors.white, snackPosition: SnackPosition.TOP);
    }
  }

  getheight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  animation() {
    animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticOut,
      ),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );

    animationController.forward();
  }

  @override
  void onInit() {
    super.onInit();
    animation();
    topuser();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
