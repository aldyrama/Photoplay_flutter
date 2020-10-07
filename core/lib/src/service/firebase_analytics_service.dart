import 'package:core/core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class FirebaseAnalyticsService {

  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() => FirebaseAnalyticsObserver(analytics: _analytics);

  Future logSignIn(String method) async{
    await _analytics.logLogin(loginMethod: method);
  }

  Future logSignUp(String method) async{
    await _analytics.logSignUp(signUpMethod: method);
  }

  Future logAppOpen(SignInEvent signIn) async{
    await _analytics.logAppOpen();
  }

  Future logApp(SignInEvent signIn) async{
    await _analytics.logEvent(name: null);
  }

}