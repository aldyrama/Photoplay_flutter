import 'dashboard.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class InitialDashboard extends DashboardState {}
