import 'package:quiz_clean_archi/domain/core/interfaces/splash_interface/splash_repository.dart';
import 'package:quiz_clean_archi/infrastructure/dal/services/notifactions/firebase_messing.dart';

class SplashDaos implements SplashRepository {
  FirebaseMessing firebaseMessaging = FirebaseMessing();
  @override
  initilizefirebasemessage() async {
    firebaseMessaging.initilizefirebasemessage();
  }
}
