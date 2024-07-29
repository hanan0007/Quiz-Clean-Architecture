// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuestionEntitis {
  String question;
  List<String> incorrectAnswers;
  String correctAnswer;
  QuestionEntitis({
    required this.question,
    required this.incorrectAnswers,
    required this.correctAnswer,
  });

  QuestionEntitis copyWith({
    String? question,
    List<String>? incorrectAnswers,
    String? correctAnswer,
  }) {
    return QuestionEntitis(
      question: question ?? this.question,
      incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
      correctAnswer: correctAnswer ?? this.correctAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'incorrectAnswers': incorrectAnswers,
      'correctAnswer': correctAnswer,
    };
  }

  factory QuestionEntitis.fromMap(Map<String, dynamic> map) {
    return QuestionEntitis(
      question: map['question'] as String,
      incorrectAnswers:
          List<String>.from((map['incorrectAnswers'] as List<String>)),
      correctAnswer: map['correctAnswer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionEntitis.fromJson(String source) =>
      QuestionEntitis.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuestionEntitis(question: $question, incorrectAnswers: $incorrectAnswers, correctAnswer: $correctAnswer)';

  @override
  bool operator ==(covariant QuestionEntitis other) {
    if (identical(this, other)) return true;

    return other.question == question &&
        listEquals(other.incorrectAnswers, incorrectAnswers) &&
        other.correctAnswer == correctAnswer;
  }

  @override
  int get hashCode =>
      question.hashCode ^ incorrectAnswers.hashCode ^ correctAnswer.hashCode;
}
