import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_clean_archi/domain/core/usecase/login_usecase/store_user_firebase.dart';
import 'package:quiz_clean_archi/domain/core/usecase/login_usecase/write_usercredentioal_usecase.dart';
import 'package:quiz_clean_archi/infrastructure/dal/models/user_model/user_model.dart';
import 'package:uuid/uuid.dart';

import '../../../infrastructure/navigation/routes.dart';

class LoginController extends GetxController {
  final WriteUsercredentioalUsecase writeUsercredentioalUsecase;
  final StoreUserFirebaseUsecase storeUserFirebaseUsecase;
  LoginController(
      this.writeUsercredentioalUsecase, this.storeUserFirebaseUsecase);
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  RxString selectedGende = 'Select Gender'.obs;
  RxBool isloading = false.obs;
  var isButtonEnabled = false.obs;
  late UserModel user;
  GetStorage getStorage = GetStorage();
  void selectGender(String gender) {
    selectedGende.value = gender;
    genderController.text = gender;
    update();
  }

  updateloading(bool loadin) {
    isloading.value = loadin;
    update();
  }

  writeCred() async {
    await writeUsercredentioalUsecase.execute(
        nameController.text, ageController.text, selectedGende.value);
    storeUsertoDb();
  }

  Future<void> storeUsertoDb() async {
    var uuid = const Uuid();
    String id = uuid.v4();
    getStorage.write("id", id);
    user = UserModel(
        id: id,
        name: nameController.text,
        age: ageController.text,
        gender: selectedGende.value,
        completion: 0,
        correct: 0,
        totalquestion: 0,
        wrong: 0);
    await storeUserFirebaseUsecase.execute(user);
    _nextscreen();
  }

  _nextscreen() {
    Future.delayed(const Duration(seconds: 0), () {
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
