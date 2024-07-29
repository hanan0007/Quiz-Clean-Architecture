import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/user_model/user_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // add the user to firebase
  Future<void> addUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).set(user.toMap());
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
          .timeout(const Duration(seconds: 10));
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

  // stream of userscore
  // get data using firestream
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUserData() {
    GetStorage storage = GetStorage();
    String id = storage.read('id');
    return _firestore.collection('users').doc(id).snapshots();
  }

  // topuser
  Future<List<Map<String, dynamic>>> getTopUsers() async {
    QuerySnapshot snapshot = await _firestore
        .collection('users')
        .orderBy('correct', descending: true)
        .limit(3)
        .get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  // === update user data
  Future<void> updateUserStats(String userId, int correct, int total) async {
    DocumentReference userRef = _firestore.collection('users').doc(userId);

    await _firestore.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(userRef);
      if (!snapshot.exists) {
        throw Exception("User does not exist!");
      }

      int currentCorrect = snapshot['correct'] ?? 0;
      int currentTotal = snapshot['totalquestion'] ?? 0;
      int currentWrong = snapshot['wrong'] ?? 0;

      transaction.update(userRef, {
        'correct': currentCorrect + correct,
        'totalquestion': currentTotal + total,
        'wrong': currentWrong + (total - correct),
      });
    });
  }
}
