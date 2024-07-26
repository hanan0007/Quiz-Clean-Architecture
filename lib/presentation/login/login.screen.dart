import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/const/global_const.dart';

import '../../domain/const/text_const.dart';
import '../widgets/button.dart';
import '../widgets/textform_feild.dart';
import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            colorScheme(context).primary,
            colorScheme(context).secondary
          ],
          begin: Alignment.topCenter,
        )),
        child: Obx(
          () => Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.1,
                        ),
                        SizedBox(
                            width: width * 0.3,
                            child: Image.asset('assets/images/app_logo.png')),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Name:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: AppTextSizes.titleMediumFont),
                            ),
                            Card(
                              shadowColor: colorScheme(context).secondary,
                              elevation: 2,
                              child: SizedBox(
                                width: width * 0.7,
                                child: CTextField(
                                    prefexIcon: Icons.person,
                                    hint: 'Enter your name',
                                    controller: controller.nameController,
                                    borderColor: Colors.grey,
                                    borderRadius: 12),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            const Text(
                              'Age:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: AppTextSizes.titleMediumFont),
                            ),
                            Card(
                              shadowColor: colorScheme(context).secondary,
                              elevation: 2,
                              child: SizedBox(
                                width: width * 0.7,
                                child: CTextField(
                                    keyboardType: TextInputType.number,
                                    prefexIcon: Icons.calendar_today_rounded,
                                    hint: 'Enter your age',
                                    controller: controller.ageController,
                                    textInputAction: TextInputAction.done,
                                    borderColor: Colors.grey,
                                    borderRadius: 12),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        // Text(
                        //   'Sex',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: TextSize.largetitle(context)),
                        // ),
                        Card(
                          shadowColor: colorScheme(context).secondary,
                          elevation: 2,
                          child: PopupMenuButton<String>(
                            // color: colorScheme(context).secondaryContainer,
                            onSelected: (value) {
                              controller.selectGender(value);
                            },
                            child: SizedBox(
                              width: width * 0.6,
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    controller.selectedGende,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: AppTextSizes.titleSmallFont),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: colorScheme(context).secondary,
                                  ),
                                ],
                              ),
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'Male',
                                child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth: width * 0.45,
                                        minWidth: width * 0.45),
                                    child: const Text('Male')),
                              ),
                              const PopupMenuItem<String>(
                                value: 'Female',
                                child: Text('Female'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'Other',
                                child: Text('Other'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                        SizedBox(
                            width: width * 0.6,
                            child: Image.asset('assets/images/app_name.png')),
                        SizedBox(
                          height: height * 0.08,
                        ),
                        Obx(
                          () => CButton(
                              ontab: controller.isButtonEnabled.value
                                  ? () {
                                      // controller.writeCredentional();
                                      controller.writeCred();
                                      controller.updateloading(true);
                                      // controller.nextscreen();
                                    }
                                  : null,
                              btnwidth: width * 0.4,
                              shadow: controller.isButtonEnabled.value
                                  ? true
                                  : false,
                              bgcolor: controller.isButtonEnabled.value
                                  ? Colors.white
                                  : Colors.grey.withOpacity(0.7),
                              text: 'Next',
                              fontWeight: FontWeight.bold,
                              fontsize: AppTextSizes.titleLargeFont,
                              txtcolor: controller.isButtonEnabled.value
                                  ? Colors.black
                                  : Colors.white),
                        ),
                        // SizedBox(
                        //   height: height * 0.03,
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              controller.isloading.value
                  ? Container(
                      height: height,
                      width: width,
                      color: Colors.grey.withOpacity(0.5),
                      child: SpinKitFadingCircle(
                        color: colorScheme(context).secondary,
                        size: 50.0,
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
