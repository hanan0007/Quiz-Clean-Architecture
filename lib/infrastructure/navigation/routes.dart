// ignore_for_file: constant_identifier_names

class Routes {
  static Future<String> get initialRoute async {
    return SPLASH;
  }

  static const DASHBOARD = '/dashboard';
  static const HOME = '/home';
  static const LEADERBOARD = '/leaderboard';
  static const LOGIN = '/login';
  static const QUIZ = '/quiz';
  static const SPLASH = '/splash';
  static const QUIZCOMPLETION = '/quizcompletion';
}
