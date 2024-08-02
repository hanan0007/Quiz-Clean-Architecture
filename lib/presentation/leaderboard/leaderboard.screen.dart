import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/const/global_const.dart';
import 'package:quiz_clean_archi/infrastructure/theme/widgetsTheme/text_theme.dart';

import '../../infrastructure/dal/services/app_images/app_images.dart';
import 'controllers/leaderboard.controller.dart';
import 'marquee_text.dart';

class LeaderboardScreen extends GetView<LeaderboardController> {
  const LeaderboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final height = controller.getheight(context);
    final width = MediaQuery.of(context).size.width;
    final AppImgesController imagecontroller = Get.find();
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imagecontroller.getImageByIndex(5).image,
          fit: BoxFit.cover,
        ),
      ),
      child: Obx(() {
        if (controller.topUsers.isEmpty) {
          return SpinKitFadingCircle(
            color: colorScheme(context).secondary,
            size: 50.0,
          );
        }
        return Stack(
          children: [
            Positioned(
              bottom: height * 0.52,
              child: Container(
                height: height * 0.2,
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/leaderforeground.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.66,
              left: width * 0.140,
              child: LeaderboardEntry(
                score: '${controller.topUsers[1]['correct']}/',
                imagePath: controller.topUsers[1]['gender'] == 'Male'
                    ? 'assets/images/ic_men.png'
                    : 'assets/images/ic_women.png',
                totalqueston: '${controller.topUsers[1]['totalquestion']}',
                name: controller.topUsers[1]['name'],
                animationDelay: 1,
              ),
            ),
            Positioned(
              bottom: height * 0.66,
              right: width * 0.140,
              child: LeaderboardEntry(
                score: '${controller.topUsers[2]['correct']}/',
                imagePath: controller.topUsers[2]['gender'] == 'Male'
                    ? 'assets/images/ic_men.png'
                    : 'assets/images/ic_women.png',
                name: controller.topUsers[2]['name'],
                totalqueston: '${controller.topUsers[2]['totalquestion']}',
                animationDelay: 2,
              ),
            ),
            Positioned(
              bottom: height * 0.70,
              left: width * 0.185,
              right: width * 0.185,
              child: LeaderboardEntry(
                score: '${controller.topUsers[0]['correct']}/',
                totalqueston: '${controller.topUsers[0]['totalquestion']}',
                imagePath: controller.topUsers[0]['gender'] == 'Male'
                    ? 'assets/images/ic_men.png'
                    : 'assets/images/ic_women.png',
                name: controller.topUsers[0]['name'],
                animationDelay: 3,
                isTop: true,
              ),
            ),
            Positioned(
              bottom: height * 0.17,
              left: width * 0.07,
              right: width * 0.07,
              child: ScaleTransition(
                scale: controller.scaleAnimation,
                child: FadeTransition(
                  opacity: controller.fadeAnimation,
                  child: Image.asset('assets/images/ic_champ.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.05),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.transparent.withOpacity(0.7),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: height * 0.035,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    ));
  }
}

class LeaderboardEntry extends StatelessWidget {
  final String score;
  final String imagePath;
  final String totalqueston;
  final String name;
  final int animationDelay;
  final bool isTop;

  const LeaderboardEntry({
    super.key,
    required this.score,
    required this.totalqueston,
    required this.imagePath,
    required this.name,
    this.animationDelay = 0,
    this.isTop = false,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(seconds: animationDelay),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 50 * (1 - value)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      score,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isTop ? 24 : 20,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      totalqueston,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ScaleTransition(
                  scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                    CurvedAnimation(
                      parent: AnimationController(
                        duration: const Duration(milliseconds: 500),
                        vsync: Scaffold.of(context),
                      )..forward(),
                      curve: Curves.elasticOut,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: isTop ? 35 : 30,
                    backgroundColor: Colors.transparent,
                    foregroundImage: AssetImage(imagePath),
                  ),
                ),
                SizedBox(
                    height: 30,
                    width: 60,
                    child: MarqueeText(
                      scrollSpeed: 1,
                      text: "this is dummy  umeeeeerr ksjdks mmmmmmm",
                    ))
                //zedBox(width: 70, height: 20, child:)
              ],
            ),
          ),
        );
      },
    );
  }
}
