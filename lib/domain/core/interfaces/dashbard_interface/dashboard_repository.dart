import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DashboardRepository {
  launchEmail();
  shareapp();
  Future<Map<String, dynamic>> readUser();
  Future<String?> checkVersion();
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUserScore();
}
