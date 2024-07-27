import 'package:get_storage/get_storage.dart';
import 'package:quiz_clean_archi/domain/core/interfaces/dashbard_interface/dashboard_repository.dart';
import 'package:quiz_clean_archi/infrastructure/dal/services/db/database_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class DashboardDaos implements DashboardRepository {
  final FirebaseService firebaseService;
  DashboardDaos(this.firebaseService);
  @override
  // ==== Launch Email
  launchEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'mohammadhanan824@gmail.com',
      query: 'subject=App Feedback',
    );
    var url = params.toString();
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {}
  }

// ==== Share App
  @override
  shareapp() async {
    await Share.share(
        'Check out this fantastic app: https://play.google.com/store/apps/details?id=com.hmtechs.quiz_app');
  }

  // ====Read User Credentional
  @override
  Future<Map<String, dynamic>> readUser() async {
    GetStorage data = GetStorage();
    String? name = data.read('name');
    String? age = data.read('age');
    String? gender = data.read('gender');
    return {
      'name': name,
      'age': age,
      'gender': gender,
    };
  }

  @override
  Future<String?> checkVersion() async {
    return await firebaseService.fetchVersionFromFirestore();
  }
}
