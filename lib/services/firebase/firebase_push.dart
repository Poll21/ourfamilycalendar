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

   final fCMToken = await _firebaseMessaging.getToken(
     vapidKey: 'BG9KEICK-zDsXdoziaQBjtJuRDtNjvS1gmZFin5d1HPDtF9VXFSzrxgKKKAkiUe4BvGcNCF5YMhBi4N-J5Wp54s'
   );
   print(fCMToken);
   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

  }


}