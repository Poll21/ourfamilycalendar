import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_connect_state.dart';

class InternetConnectCubit extends Cubit<InternetConnectState> {
  final Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _connectivityStream;

  InternetConnectCubit({
    required Connectivity connectivity})
      : _connectivity = connectivity,
        super (InternetConnectState()) {
    _connectivityStream = _connectivity.onConnectivityChanged.listen((ConnectivityResult res) {
      if(res == ConnectivityResult.wifi || res ==ConnectivityResult.mobile){
        emit(InternetConnectState(type: InternetType.online));
      }
      else if(res == ConnectivityResult.none){
        emit(InternetConnectState(type: InternetType.offline));
      } else {
        emit(InternetConnectState(type: InternetType.unknown));
      }
    });
  }

@override
  Future<void> close() {
    _connectivityStream.cancel();
    return super.close();
  }

}
