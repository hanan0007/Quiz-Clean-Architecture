import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/const/global_const.dart';
import 'package:quiz_clean_archi/domain/const/text_const.dart';
import 'package:quiz_clean_archi/infrastructure/navigation/routes.dart';

import '../../infrastructure/dal/services/app_exit/appexit_confermation.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        AppExitConfermation.showExitConfirmationDialog(context);
      },
      child: Scaffold(
        // bottomNavigationBar: controller.isBottomBannerAdLoaded
        //     ? SizedBox(
        //         height: controller.bottomBannerAd.size.height.toDouble(),
        //         width: controller.bottomBannerAd.size.width.toDouble(),
        //         child: AdWidget(ad: controller.bottomBannerAd),
        //       )
        //     : null,
        key: scaffoldKey,
        appBar: AppBar(
          surfaceTintColor: colorScheme(context).secondary,
          leading: InkWell(
            onTap: () {
              Get.offNamed(Routes.DASHBOARD);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: colorScheme(context).secondary,
          title: const Text('Lets start'),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/untitile.png"),
                  opacity: 0.3)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Text(
                    'Select Your Categories',
                    style: TextStyle(fontSize: AppTextSizes.titleLargeFont),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: width * 0.9,
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(
                          controller.names.length,
                          (index) {
                            return InkWell(
                              onTap: () async {
                                await controller
                                    .selectedcat(controller.catagory[index]);
                                Get.toNamed(Routes.QUIZ, arguments: {
                                  'cat': controller.cat,
                                  'name': controller.names[index]
                                }
                                    // () => QuizView(
                                    //   category: controller.cat,
                                    //   catname: controller.names[index],
                                    // ),
                                    );
                              },
                              child: Card(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.transparent.withOpacity(0.35)
                                    : Colors.grey.withOpacity(0.4),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            controller.imagePaths[index],
                                            width: 100,
                                            height: 100,
                                          ),
                                          Text(
                                            controller.names[index],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    AppTextSizes.labelLargeFont,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
