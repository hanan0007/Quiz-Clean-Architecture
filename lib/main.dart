import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_clean_archi/firebase_options.dart';
import 'package:quiz_clean_archi/infrastructure/dal/services/connectivity/internet_connectivity.dart';
import 'package:quiz_clean_archi/infrastructure/dal/services/sound/global_music.dart';

import 'package:quiz_clean_archi/infrastructure/theme/theme.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _checkinterjnet();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  var initialRoute = await Routes.initialRoute;
  Get.put(AudioController());
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.instance.light,
      darkTheme: AppTheme.instance.dark,
      themeMode: ThemeMode.system,
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}

Future<void> _checkinterjnet() async {
  await ConnectivityService.checkConnectivity();
}
