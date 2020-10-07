import 'dart:convert';
import 'dart:io';

import 'package:BaseApp/ui/ui.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';
import 'package:BaseApp/locator/locator.dart';


class FirebasePushNotificationService{
  final FirebaseMessaging _fcm = FirebaseMessaging();
  final Navigation navigation = locator<Navigation>();
  final DashBoardScreenState dashBoardScreenState = locator<DashBoardScreenState>();

  Future initialize() async{
    print("initial");
   if(Platform.isIOS) iosPermission();

   _fcm.configure(

     onMessage: (Map<String, dynamic> message) async {
       print("onMessage: $message");
     },

     onLaunch: (Map<String, dynamic> message) async {
       print("onLaunch: $message");
       serialiseAndNavigate(message);
     },

     onResume: (Map<String, dynamic> message) async {
       print("onResume: ${json.encode(message)}");
       serialiseAndNavigate(message);
     },

     // onBackgroundMessage: myBackgroundMessageHandler,

   );

   var data;
   _fcm.getToken().then((token){
     print("Fcm token : " + token.toString());
     data = token.toString();
   });

    print("object fcm : ${data}");


    subscribeTopic();

 }


 void myBackgroundMessageHandler(Map<String, dynamic> message) {
   if (message.containsKey('data')) {
     // Handle data message
     final dynamic data = message['data'];
   }

   if (message.containsKey('notification')) {
     final dynamic notification = message['notification'];

   }
 }

 void iosPermission(){
   _fcm.requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
   _fcm.requestNotificationPermissions(IosNotificationSettings());
 }

 void subscribeTopic() async{
   _fcm.subscribeToTopic("base");
 }

 void serialiseAndNavigate(Map<String, dynamic> message) {
   var notifData = message['data'];
   if(notifData != null){
     navigation.onIntent(notifData["screen"]);
   }
 }

}
