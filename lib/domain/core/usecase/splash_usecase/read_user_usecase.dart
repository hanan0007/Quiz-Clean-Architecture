import 'package:quiz_clean_archi/domain/core/interfaces/dashbard_interface/dashboard_repository.dart';

class ReadUserUsecase {
  final DashboardRepository dashboardRepository;
  ReadUserUsecase(this.dashboardRepository);
  Future<Map<String, dynamic>> execute() {
    return dashboardRepository.readUser();
  }
}
