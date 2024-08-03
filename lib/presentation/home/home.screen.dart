import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/const/global_const.dart';
import 'package:quiz_clean_archi/domain/const/text_const.dart';
import 'package:quiz_clean_archi/infrastructure/navigation/routes.dart';
// import 'package:scrollable_text/scrollable_text.dart';
// import 'package:text_scroll/text_scroll.dart';

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
                  ),
                  // new Expanded(
                  //   flex: 1,
                  //   child: new SingleChildScrollView(
                  //     scrollDirection: Axis.vertical, //.horizontal
                  //     child: new Text(
                  //       "1 Description that is too long in text format(Here Data is coming from API) jdlksaf j klkjjflkdsjfkddfdfsdfds " +
                  //           "2 Description that is too long in text format(Here Data is coming from API) d fsdfdsfsdfd dfdsfdsf sdfdsfsd d " +
                  //           "3 Description that is too long in text format(Here Data is coming from API)  adfsfdsfdfsdfdsf   dsf dfd fds fs" +
                  //           "4 Description that is too long in text format(Here Data is coming from API) dsaf dsafdfdfsd dfdsfsda fdas dsad" +
                  //           "5 Description that is too long in text format(Here Data is coming from API) dsfdsfd fdsfds fds fdsf dsfds fds " +
                  //           "6 Description that is too long in text format(Here Data is coming from API) asdfsdfdsf fsdf sdfsdfdsf sd dfdsf" +
                  //           "7 Description that is too long in text format(Here Data is coming from API) df dsfdsfdsfdsfds df dsfds fds fsd" +
                  //           "8 Description that is too long in text format(Here Data is coming from API)" +
                  //           "9 Description that is too long in text format(Here Data is coming from API)" +
                  //           "10 Description that is too long in text format(Here Data is coming from API)",
                  //       style: new TextStyle(
                  //         fontSize: 16.0,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // ScrollableText(
                  //   'This is the sample text for Flutter ScrollableText widget.hello this is ',
                  //   mode: ScrollableTextMode.endless,
                  //   velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
                  //   delayBefore: Duration(milliseconds: 500),
                  //   numberOfReps: 5,
                  //   pauseBetween: Duration(milliseconds: 50),
                  //   style: TextStyle(color: Colors.green),
                  //   textAlign: TextAlign.right,
                  //   selectable: true,
                  // ),
                  // const Myscroll(
                  //     mode: MyscrollMode.bouncing,
                  //     fadeBorderSide: FadeBorderSide.both,
                  //     velocity: Velocity(pixelsPerSecond: Offset(200, 0)),
                  //     fadedBorder: true,
                  //     style: TextStyle(color: Colors.amber),
                  //     // mode: TextScrollMode.bouncing,
                  //     'This is the sample text for Flutter TextScroll widget.hello this is '),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
