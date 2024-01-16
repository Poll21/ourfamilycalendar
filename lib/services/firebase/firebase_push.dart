import 'package:firebase_messaging/firebase_messaging.dart';
Future<void> handleBackgroundMessage(RemoteMessage message) async{
  print("Titel: ${message.notification?.title}");
  print("Body: ${message.notification?.body}");
  print("payload: ${message.data}");
}
class FirebasePush{
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission();
   final fCMToken = await _firebaseMessaging.getToken();
   print(fCMToken);
   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

  }


}