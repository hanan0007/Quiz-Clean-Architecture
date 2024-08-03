import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pushable_button/pushable_button.dart';
import 'package:quiz_clean_archi/domain/const/global_const.dart';
import 'package:quiz_clean_archi/infrastructure/dal/services/app_exit/appexit_confermation.dart';
import 'package:quiz_clean_archi/infrastructure/dal/services/sound/global_music.dart';
import 'package:quiz_clean_archi/infrastructure/navigation/routes.dart';
import 'package:quiz_clean_archi/presentation/dashboard/score_circle/circle_score.dart';
import 'package:quiz_clean_archi/presentation/dashboard/score_circle/empty_circle.dart';
import 'controllers/dashboard.controller.dart';
import 'user_profile_dialogue.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final AudioController audioController = Get.find();
    return Scaffold(
      // bottomNavigationBar: controller.isBottomBannerAdLoaded
      //     ? SizedBox(
      //         height: controller.bottomBannerAd.size.height.toDouble(),
      //         width: controller.bottomBannerAd.size.width.toDouble(),
      //         child: AdWidget(ad: controller.bottomBannerAd),
      //       )
      //     : null,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: 400,
                  width: width,
                  decoration: BoxDecoration(
                      color: colorScheme(context).secondary,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Obx(
                      () => Stack(
                        alignment: Alignment.center,
                        children: [
                          controller.isLoading.value
                              ? SizedBox(
                                  height: 180, // Adjusted height
                                  width: 180, // Adjusted width
                                  child: CustomPaint(
                                    painter: MyPainterEmptyCircle(),
                                  ),
                                )
                              : CircleView(
                                  radius: 180,
                                  righValue: controller.user.value.correct,
                                  totalValue:
                                      controller.user.value.totalquestion,
                                  // controller: controller,
                                  wrongValue: controller.user.value.wrong),
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color.fromARGB(255, 31, 31, 31)
                                    : Colors.white,
                            radius: 65,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Your Score',
                                    style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Obx(
                                    () => Text(
                                      // "12",
                                      controller.calculatescore.value,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: colorScheme(context).secondary,
                                          fontSize: 30),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'pt',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 160,
                ),
                SizedBox(
                  width: width * 0.4,
                  child: PushableButton(
                    height: 50,
                    elevation: 4,
                    hslColor: HSLColor.fromColor(
                        colorScheme(context).secondary), // Red color
                    shadow: BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                    child: Text('Lets Play!',
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),

                    onPressed: () {
                      Get.offNamed(Routes.HOME);
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: IconButton(
                              icon: const Icon(Icons.person),
                              onPressed: () {
                                // firebaseService
                                //     .fetchVersionFromFirestore(context);
                                // FirebaseService.fetchVersionFromFirestore();
                                //===========
                                ProfileDialog.showProfileDialog(
                                    context,
                                    controller.name,
                                    controller.age,
                                    controller.gender);
                              },
                            ),
                          ),
                          const Text('Profile'),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: IconButton(
                              icon: const Icon(Icons.leaderboard_outlined),
                              onPressed: () {
                                Get.toNamed(Routes.LEADERBOARD);
                              },
                            ),
                          ),
                          const Text('Leaderboard')
                        ],
                      ),
                      Obx(() => Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                child: IconButton(
                                  icon: Icon(audioController.isPlaying
                                      ? Icons.volume_up
                                      : Icons.volume_off),
                                  onPressed: () {
                                    audioController.toggleMusic();
                                  },
                                ),
                              ),
                              const Text('Sound')
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: IconButton(
                              icon: const Icon(Icons.reviews),
                              onPressed: () {
                                controller.emaillaunch();
                              },
                            ),
                          ),
                          const Text('Review'),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () {
                                controller.shareApp();
                              },
                            ),
                          ),
                          const Text('Share')
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: IconButton(
                              onPressed: () {
                                AppExitConfermation.showExitConfirmationDialog(
                                    context);
                              },
                              icon: const Icon(Icons.exit_to_app),
                            ),
                          ),
                          const Text('Exit')
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                )
              ],
            ),
            Positioned(
              top: 300,
              child: Card(
                shadowColor: Colors.grey,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Container(
                  height: 180,
                  width: width * 0.9,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Center(
                    child: Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const CircularProgressIndicator();
                        } else {
                          List data = [
                            'Completion',
                            'Total Questions',
                            'Correct',
                            'Wrong',
                          ];
                          List dataint = [
                            controller.calculatecompletion.value,
                            '${controller.user.value.totalquestion}',
                            '${controller.user.value.correct}',
                            '${controller.user.value.wrong}',
                          ];

                          return GridView.builder(
                            itemCount: data.length,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 85,
                                    crossAxisSpacing: 20),
                            itemBuilder: (context, index) {
                              Color color = index == 2
                                  ? Colors.green
                                  : index == 3
                                      ? Colors.red
                                      : colorScheme(context).secondary;
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        size: width * 0.05,
                                        color: color,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        dataint[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: color,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      Text(
                                        data[index],
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
