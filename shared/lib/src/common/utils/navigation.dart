import 'package:get/get.dart';

import 'utils.dart';

class Navigation {
  /// class for navigation between pages

  // GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  //
  // GlobalKey<NavigatorState> get navigationKey => _navigationKey;
  //
  // void pop() {
  //   return _navigationKey.currentState.pop();
  // }
  //
  // Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
  //   return _navigationKey.currentState.pushNamed(routeName, arguments: arguments);
  // }

  void onBack() {
    Get.back();
  }

  void onBackWithData(BuildContext context, Object result){
    Navigator.pop(context, result);
  }

  void onIntent(String nameRouted, {Object argumentClass}) {
    Get.toNamed(nameRouted, arguments: argumentClass);
  }

  void onIntentOff(String nameRouted, {Object argumentClass}){
    Get.offNamed(nameRouted, arguments: argumentClass);
  }

  void onIntentOffAll(String nameRouted, {Object argumentClass}) {
    Get.offAllNamed(nameRouted, arguments: argumentClass);
  }

  static launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}