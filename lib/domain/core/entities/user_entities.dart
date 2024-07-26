class UserEntities {
  String id;
  String name;
  String age;
  String gender;
  int completion;
  int correct;
  int totalquestion;
  int wrong;
  UserEntities(
      {required this.id,
      required this.name,
      required this.age,
      required this.gender,
      required this.completion,
      required this.correct,
      required this.totalquestion,
      required this.wrong});
}
