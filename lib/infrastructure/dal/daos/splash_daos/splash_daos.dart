import 'package:quiz_clean_archi/domain/core/interfaces/splash_interface/splash_repository.dart';
import 'package:quiz_clean_archi/infrastructure/dal/services/notifactions/firebase_messing.dart';

class SplashDao implements SplashRepository {
  FirebaseMessing firebaseMessaging;

  SplashDao(this.firebaseMessaging);
  @override
  Future<void> initilizefirebasemessage() async {
    firebaseMessaging.initilizefirebasemessage();
  }

  @override
  Future<void> gettoken() async {
   
    await firebaseMessaging.gettoken();
  }
}
