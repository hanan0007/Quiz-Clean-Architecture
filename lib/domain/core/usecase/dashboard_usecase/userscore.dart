import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_clean_archi/domain/core/interfaces/dashbard_interface/dashboard_repository.dart';

class UserscoreUsecase {
  final DashboardRepository dashboardRepository;
  UserscoreUsecase(this.dashboardRepository);
  Stream<DocumentSnapshot<Map<String, dynamic>>> execute() {
    return dashboardRepository.streamUserScore();
  }
}
