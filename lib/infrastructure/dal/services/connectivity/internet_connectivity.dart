import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../presentation/nointernet/nointernet_screen.dart';

class ConnectivityService {
  static Connectivity connectivity = Connectivity();
  static final getStorage = GetStorage();
  static checkConnectivity() {
    connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.none)) {
        Get.to(() => const DefaultScreen());
      }
    });
  }

  // static checkInternetConnection() async {
  //   GetStorage getStorage = GetStorage();
  //   final isLogin = getStorage.read("name");
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   print('Connectivity Result: $connectivityResult'); // Debugging log

  //   if (connectivityResult.contains(ConnectivityResult.mobile) ||
  //       connectivityResult.contains(ConnectivityResult.wifi)) {
  //     // Connected to the internet
  //     print('connected');
  //     checkConnectivity();
  //     Future.delayed(const Duration(seconds: 2), () {
  //       if (isLogin != null) {
  //         Get.offAll(() => const DashboardView());
  //       } else {
  //         Get.offAll(() => const LoginView());
  //       }
  //     });
  //   } else {
  //     print('not connected');
  //     checkConnectivity();
  //     Get.to(() => const DefaultScreen());
  //   }
  // }
}
