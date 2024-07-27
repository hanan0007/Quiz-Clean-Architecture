abstract class DashboardRepository {
  launchEmail();
  shareapp();
  Future<Map<String, dynamic>> readUser();
  Future<String?> checkVersion();
}
