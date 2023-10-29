import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:our_family_calendar/blocs/loading_bloc/loading_bloc.dart';
import 'package:our_family_calendar/domain/my_user.dart';

part 'auth_event.dart';

part 'auth_state.dart';

final loadingBloc = LoadingBloc();
final _firebaseAuth = FirebaseAuth.instance;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<AuthSingInEmailEvent>((event, emit) async {
      loadingBloc.add(LoadingIndicatorEvent(true));
      await _onAuthSingInEmailEvent(event, emit);
      loadingBloc.add(LoadingIndicatorEvent(false));
    }, transformer: sequential());

    on<AuthRegistrationEmailEvent>((event, emit) async {
      loadingBloc.add(LoadingIndicatorEvent(true));
      await _onAuthRegistrationEmailEvent(event, emit);
      loadingBloc.add(LoadingIndicatorEvent(false));
    }, transformer: sequential());

    on<AuthLogOutEvent>((event, emit) async {
      loadingBloc.add(LoadingIndicatorEvent(true));
      await _onAuthLogOutEvent(event, emit);
      loadingBloc.add(LoadingIndicatorEvent(false));
    }, transformer: sequential());
  }

  _onAuthSingInEmailEvent(
      AuthSingInEmailEvent event, Emitter<AuthState> emit) async {
    try {
      final reqvest = await _firebaseAuth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      if (reqvest.user != null) {
        emit(state.copyWith(user: MyUser.setUserCredential(reqvest.user!)));
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  _onAuthRegistrationEmailEvent(
      AuthRegistrationEmailEvent event, Emitter<AuthState> emit) async{
    try {
      final reqvest = await _firebaseAuth.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      if (reqvest.user != null) {
        emit(state.copyWith(user: MyUser.setUserCredential(reqvest.user!)));
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  _onAuthLogOutEvent(AuthLogOutEvent event, Emitter<AuthState> emit) async{
    await _firebaseAuth.signOut();
    emit(state.copyWith(user: null));
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



