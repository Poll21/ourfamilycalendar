import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:our_family_calendar/domain/settings_user/settings_user_firebase.dart';
import 'package:our_family_calendar/domain/settings_user/user_setting.dart';

class DatabaseService {
  final CollectionReference _settingsUser =
      FirebaseFirestore.instance.collection("settingsUser");

  Future addSettingsUser(SettingsUserFirebase settingsUser) async {
    return await _settingsUser
        .doc(settingsUser.idUser)
        .set(settingsUser.settings.toJson());
  }

  Future<UserSetting> getSettingsUser(String idUser) async{
    final settingsUserFirebase = await _settingsUser.doc(idUser).get();
    final data = settingsUserFirebase.data() as Map<String,dynamic>;
   final userSetting = UserSetting.fromJson(data);
   print(userSetting.socialRole);
    return userSetting;
  }

}
