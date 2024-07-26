import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/core/usecase/login_usecase/write_usercredentioal_usecase.dart';

import '../../../infrastructure/navigation/routes.dart';

class LoginController extends GetxController {
  final WriteUsercredentioalUsecase writeUsercredentioalUsecase;
  LoginController(this.writeUsercredentioalUsecase);
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  String selectedGende = 'Select Gender';
  RxBool isloading = false.obs;
  var isButtonEnabled = false.obs;
  void selectGender(String gender) {
    selectedGende = gender;
    genderController.text = gender;
    update();
  }

  updateloading(bool loadin) {
    isloading.value = loadin;
    update();
  }

  writeCred() async {
    await writeUsercredentioalUsecase.execute(
        nameController.text, ageController.text, selectedGende);
    _nextscreen();
  }

  _nextscreen() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(Routes.DASHBOARD);
    });
  }

  void _checkFields() {
    if (nameController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        selectedGende != 'Select Gender') {
      isButtonEnabled.value = true;
    } else {
      isButtonEnabled.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController.addListener(_checkFields);
    ageController.addListener(_checkFields);
    genderController.addListener(_checkFields);
  }
}
