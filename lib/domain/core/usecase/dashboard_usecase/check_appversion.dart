import 'package:quiz_clean_archi/domain/core/interfaces/dashbard_interface/dashboard_repository.dart';

class CheckAppversionUseCase {
  final DashboardRepository dashboardRepository;
  CheckAppversionUseCase(this.dashboardRepository);
  Future<String?> execute() {
    return dashboardRepository.checkVersion();
  }
}
