import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user_model/user_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).set(user.toMap());
      print('user hasben added');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // ==== Check App version
  Future<String?> fetchVersionFromFirestore() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('version')
          .doc('32MfXVaTJU6LVKp80kmG')
          .get()
          .timeout(const Duration(seconds: 5));
      if (documentSnapshot.exists) {
        debugPrint("The version is ${documentSnapshot.get('version')}");
        return documentSnapshot.get('version');
      } else {
        debugPrint('Document does not exist.');
        return null;
      }
    } on TimeoutException catch (_) {
      // debugPrint('Timeout fetching version: $e');
      Get.snackbar(
          'Timeout', 'Please check your internet connection and try again.',
          // ignore: use_build_context_synchronously
          colorText: Theme.of(Get.context!).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          snackPosition: SnackPosition.TOP);
      return null;
    } catch (e) {
      debugPrint('Error  Occured: $e');
      return null;
    }
  }
}
