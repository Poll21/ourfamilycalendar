import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:our_family_calendar/domain/settings_user/settings_user_firebase.dart';
import 'package:our_family_calendar/domain/settings_user/user_setting.dart';
import 'package:our_family_calendar/my_app.dart';
import 'package:our_family_calendar/services/firebase/database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting_app_event.dart';

part 'setting_app_state.dart';


class SettingAppBloc extends Bloc<SettingAppEvent, SettingAppState> {

  late final StreamSubscription _connectivityStream;

  SettingAppBloc()
      :super(const SettingAppInit()) {


    on<SettingAppGetEvent>((event, emit) async {
      await _onSettingAppGetEvent(event, emit);
    }, transformer: sequential());

    on<SettingAppSetEvent>((event, emit) async {
      await _onSettingAppSetEvent(event, emit);
    }, transformer: sequential());
  }

  _onSettingAppGetEvent(
      SettingAppGetEvent event, Emitter<SettingAppState> emit) async {

    final sharedPrefs = await SharedPreferences.getInstance();
    final _local = sharedPrefs.getString('locale');
    final _appTheme = sharedPrefs.getString('appTheme');
    final _socialRole = sharedPrefs.getString('socialRole') ?? '';
    final _email = await secureStorage.read(key: 'email') ?? '';
    final _phone = await secureStorage.read(key: 'phone') ?? '';
    final _isAuthorized = (_email != '' || _phone != '');
    emit(state.copyWith(
        locale: _local,
        appTheme: _appTheme,
        isAuthorized: _isAuthorized,
        socialRole: _socialRole,
        error: ''));
  }

  _onSettingAppSetEvent(
      SettingAppSetEvent event, Emitter<SettingAppState> emit) async {
    final _settingsUser = SettingsUserFirebase(
        settings: UserSetting(
            locale: event.locale ?? state.locale,
            appTheme: event.appTheme ?? state.appTheme,
            socialRole: event.socialRole ?? state.socialRole),
        idUser: event.userId);
    await DatabaseService().addSettingsUser(_settingsUser);
    // if (event.locale != null) {
    //   final sharedPrefs = await SharedPreferences.getInstance();
    //   sharedPrefs.setString('locale', event.locale!);
    // }
    // if (event.appTheme != null) {
    //   final sharedPrefs = await SharedPreferences.getInstance();
    //   sharedPrefs.setString('appTheme', event.appTheme!);
    // }
    // if (event.socialRole != null) {
    //   final sharedPrefs = await SharedPreferences.getInstance();
    //   sharedPrefs.setString('socialRole', event.socialRole!);
    // }

    emit(state.copyWith(
      locale: event.locale,
      appTheme: event.appTheme,
      isAuthorized: event.isAuthorized,
      socialRole: event.socialRole,
      error: '',
    ));
  }

}
