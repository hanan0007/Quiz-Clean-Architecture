// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quiz_clean_archi/domain/core/entities/user_entities.dart';

class UserModel extends UserEntities {
  UserModel({
    required super.id,
    required super.name,
    required super.age,
    required super.gender,
    super.completion = 0,
    super.correct = 0,
    super.totalquestion = 0,
    super.wrong = 0,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? age,
    String? gender,
    int? completion,
    int? correct,
    int? totalquestion,
    int? wrong,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      completion: completion ?? this.completion,
      correct: correct ?? this.correct,
      totalquestion: totalquestion ?? this.totalquestion,
      wrong: wrong ?? this.wrong,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'completion': completion,
      'correct': correct,
      'totalquestion': totalquestion,
      'wrong': wrong,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      age: map['age'] as String,
      gender: map['gender'] as String,
      completion: map['completion'] as int,
      correct: map['correct'] as int,
      totalquestion: map['totalquestion'] as int,
      wrong: map['wrong'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, age: $age, gender: $gender, completion: $completion, correct: $correct, totalquestion: $totalquestion, wrong: $wrong)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.age == age &&
        other.gender == gender &&
        other.completion == completion &&
        other.correct == correct &&
        other.totalquestion == totalquestion &&
        other.wrong == wrong;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        age.hashCode ^
        gender.hashCode ^
        completion.hashCode ^
        correct.hashCode ^
        totalquestion.hashCode ^
        wrong.hashCode;
  }
}
