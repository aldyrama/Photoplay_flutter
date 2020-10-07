import 'package:BaseApp/ui/ui.dart';
import 'package:get/get.dart';

import '../../../../shared.dart';

class RouterConfig {

  static var page = [
    GetPage(name: RoutName.splashScreen, page: () => SplashScreen()),
    GetPage(name: RoutName.signInScreen, page: () => SignInScreen()),
    GetPage(name: RoutName.settingScreen, page: () => SettingScreen()),
    GetPage(name: RoutName.dashboardScreen, page: () => DashBoardScreen()),
    GetPage(name: RoutName.detailMovieScreen, page: () => DetailMovieScreen()),
  ];

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default: return FadeRoute(page: UndefinedScreen(name: settings.name,));
    }
  }

}