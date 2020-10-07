import 'package:core/core.dart';
import 'package:shared/shared.dart';
import 'package:BaseApp/locator/locator.dart';

abstract class BaseView {

  final Navigation navigation = locator<Navigation>();
  final FirebaseAnalyticsService analytics = locator<FirebaseAnalyticsService>();
  // final FacebookAnalyticsService fbAnalytics = locator<FacebookAnalyticsService>();
  final FirebasePushNotificationService fireNotification = locator<FirebasePushNotificationService>();

  bool showLoading = true;

  bool darkMode = false;

  bool keepAliveMode = false;

  int getInt( int data ) { if ( data == null ) return 0; else return data; }

  bool getBool( bool data ) { if ( data == null ) return false; else return data; }

  double getDouble( double data ) { if ( data == null ) return 0; else return data; }

  String getString( String data ) { if ( data == null ) return ""; else return data; }

  void showToast( String message, BuildContext ctx, {int duration = 1} ) {
    return Toast.show(message.toString(), ctx, duration: duration, gravity:  Toast.BOTTOM);
  }

  void showConfirmation( String message, {String title = ""} ){

  }

  void fetchData(){}

  void doRefresh(){}

  void doLoadMore({int total, int offset, int limit}){}

  void doLogout(){

  }

}