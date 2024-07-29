import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_clean_archi/infrastructure/dal/models/question_model/question_model.dart';
import 'package:http/http.dart' as http;

class TriviaService {
  Future<List<QuestionModel>?> fetchQuestions(
      int amount, String category, String difficulty) async {
    print("hellllllllllllllllllllllll");
    try {
      final response = await http
          .get(Uri.parse(
              'https://opentdb.com/api.php?amount=$amount&category=$category'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List questions = data['results'];
        return questions
            .map((question) => QuestionModel.fromJson(question))
            .toList();
      } else {
        Get.snackbar('Failure', 'Failed to load questions, try again later',
            colorText: Colors.white, snackPosition: SnackPosition.TOP);
        return null;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
          'Timeout', 'Please check your internet connection and try again.',
          colorText: Colors.white, snackPosition: SnackPosition.TOP);
      return null;
    } catch (e) {
      debugPrint('object$e');
      Get.snackbar('Error', 'An error occurred ,try again later.',
          snackPosition: SnackPosition.TOP);
      return null;
    }
  }
}
