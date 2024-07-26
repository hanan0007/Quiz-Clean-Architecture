import 'package:quiz_clean_archi/domain/core/interfaces/dashbard_interface/dashboard_repository.dart';

class LaunchEmailUseCase {
  DashboardRepository dashboardRepository;
  LaunchEmailUseCase(this.dashboardRepository);
  executeMail() {
    return dashboardRepository.launchEmail();
  }

  executeshare() {
    return dashboardRepository.shareapp();
  }
}
