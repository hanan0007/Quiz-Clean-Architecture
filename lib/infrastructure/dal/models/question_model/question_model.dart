import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:quiz_clean_archi/domain/core/entities/question_entitis.dart';

class QuestionModel extends QuestionEntitis {
  QuestionModel(
      {required super.question,
      required super.incorrectAnswers,
      required super.correctAnswer});
  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'],
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
      correctAnswer: json['correct_answer'],
    );
  }
}
