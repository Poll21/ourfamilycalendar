import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:our_family_calendar/blocs/loading_bloc/loading_bloc.dart';
import 'package:our_family_calendar/domain/my_user.dart';
import 'package:our_family_calendar/my_app.dart';
part 'auth_event.dart';

part 'auth_state.dart';

final loadingBloc = LoadingBloc();
final _firebaseAuth = FirebaseAuth.instance;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInit()) {
    on<AuthSingInEmailEvent>((event, emit) async {
      loadingBloc.add(LoadingIndicatorEvent(true));
      await _onAuthSingInEmailEvent(event, emit);
      loadingBloc.add(LoadingIndicatorEvent(false));
    }, transformer: sequential());

    on<AuthSingInEvent>((event, emit) async {
      loadingBloc.add(LoadingIndicatorEvent(true));
      await _onAuthSingInEvent(event, emit);
      loadingBloc.add(LoadingIndicatorEvent(false));
    }, transformer: sequential());

    on<AuthRegistrationEmailEvent>((event, emit) async {
      loadingBloc.add(LoadingIndicatorEvent(true));
      await _onAuthRegistrationEmailEvent(event, emit);
      loadingBloc.add(LoadingIndicatorEvent(false));
    }, transformer: sequential());

    on<AuthRegistrationPhoneEvent>((event, emit) async {
      loadingBloc.add(LoadingIndicatorEvent(true));
      await _onAuthRegistrationPhoneEvent(event, emit);
      loadingBloc.add(LoadingIndicatorEvent(false));
    }, transformer: sequential());

    on<AuthLogOutEvent>((event, emit) async {
      loadingBloc.add(LoadingIndicatorEvent(true));
      await _onAuthLogOutEvent(event, emit);
      loadingBloc.add(LoadingIndicatorEvent(false));
    }, transformer: sequential());

    on<AuthUpdateProfileEvent>((event, emit) async {
      loadingBloc.add(LoadingIndicatorEvent(true));
      await _onAuthUpdateProfileEvent(event, emit);
      loadingBloc.add(LoadingIndicatorEvent(false));
    }, transformer: sequential());
  }

  User? _user;
  String _error = '';

  _onAuthSingInEmailEvent(
      AuthSingInEmailEvent event, Emitter<AuthState> emit) async {

    try {
      final reqvest = await _firebaseAuth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      if (reqvest.user != null) {
        _user = reqvest.user;
        await secureStorage.write(key: 'email', value: event.email);
        await secureStorage.write(key: 'password', value: event.password);
        emit(state.copyWith(user: MyUser.setUserCredential(reqvest.user!)));

      }
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  _onAuthSingInEvent(AuthSingInEvent event, Emitter<AuthState> emit) async{
    final _email = await secureStorage.read(key: 'email') ?? '';
    final _password = await secureStorage.read(key: 'password') ?? '';
    try {
      final reqvest = await _firebaseAuth.signInWithEmailAndPassword(
          email: _email, password: _password);
      if (reqvest.user != null) {
        _user = reqvest.user;
        emit(state.copyWith(user: MyUser.setUserCredential(reqvest.user!)));
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
  _onAuthRegistrationEmailEvent(
      AuthRegistrationEmailEvent event, Emitter<AuthState> emit) async {
    try {
      final reqvest = await _firebaseAuth.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      if (reqvest.user != null) {
        _user = reqvest.user;
        secureStorage.write(key: 'email', value: event.email);
        secureStorage.write(key: 'password', value: event.password);
        emit(state.copyWith(user: MyUser.setUserCredential(reqvest.user!)));
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  _onAuthUpdateProfileEvent(
      AuthUpdateProfileEvent event, Emitter<AuthState> emit) async {
    // if(event.phoneNumber !=null){
    //   await _user?.updatePhoneNumber(event.phoneNumber!);
    // }
    try{
      if (event.displayName != null &&
          _user != null &&
          event.displayName != '') {
        await _user?.updateDisplayName(event.displayName);
      }
      if (event.email != null && _user != null && event.email != '') {
        await _user?.updateEmail(event.email!);
      }
      // if (event.phoneNumber != null &&
      //     _user != null &&
      //     event.phoneNumber != '') {
      //   await _user?.updatePhoneNumber(PhoneAuthCredential());
      // }
      if (event.photoURL != null && _user != null && event.photoURL != '') {

        await _user?.updatePhotoURL(event.photoURL!);
      }
      if(event.password !=null &&
          _user != null){
          await _user?.updatePassword(event.password!);
      }
      final reqvest = await _firebaseAuth.currentUser;
      if (reqvest !=null) {
        emit(state.copyWith(user: MyUser.setUserCredential(reqvest!)));
      }

    }catch(e){
      print(e.toString());
    }
  }


  _onAuthRegistrationPhoneEvent(AuthRegistrationPhoneEvent event, Emitter<AuthState> emit) async{
    if(Platform.isAndroid){
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: event.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async{
          await _firebaseAuth.signInWithCredential(credential).then((value) {
            if(value.user !=null){
              // emit(state.copyWith(user: MyUser.setUserCredential(value.user!)));
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }else{

    }
  }

  _onAuthLogOutEvent(AuthLogOutEvent event, Emitter<AuthState> emit) async {
   try {
     await secureStorage.delete(key: 'email');
     await secureStorage.delete(key: 'password');
      await _firebaseAuth.signOut();
      emit(AuthInit());
    }catch(e){
     emit(state.copyWith(error: e.toString()));
   }
  }
// _onAuthSingInPhoneEvent(AuthSingInPhoneEvent event, Emitter<AuthState> emit) async{
//   try {
//     final reqvest = await _firebaseAuth.signInWithPhoneNumber(event.phoneNumber);
//     if (reqvest.confirm(verificationCode) != null) {
//       emit(state.copyWith(user: MyUser.setUserCredential(reqvest.user!)));
//     }
//   } catch (e) {
//     emit(state.copyWith(error: e.toString()));
//   }
// }
}

