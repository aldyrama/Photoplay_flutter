import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/shared.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Navigation());
  locator.registerLazySingleton(() => FacebookAnalyticsService());
  locator.registerLazySingleton(() => FirebasePushNotificationService());
  locator.registerLazySingleton(() => FirebaseAnalyticsService());
  locator.registerLazySingleton(() => DashBoardScreenState());
}