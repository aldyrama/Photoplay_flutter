import 'package:core/core.dart';
import 'package:shared/shared.dart';

enum Flavor {
  DEVELOPMENT,
  RELEASE,
}

class Config {
  static Flavor appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return AppConstant.appName;
      case Flavor.DEVELOPMENT:
      default:
        return AppConstant.appNameDev;
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return ApiConstant.baseUrlDevelopmentApi;
      case Flavor.RELEASE:
        return ApiConstant.baseUrlProductionApi;
      default:
        return '';
    }
  }

  static bool get isDebug {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return false;
      case Flavor.DEVELOPMENT:
      default:
      return true;
    }
  }
}
