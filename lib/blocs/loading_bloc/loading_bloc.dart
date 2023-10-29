import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'loading_event.dart';

part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(const LoadingState(loadingScreen: false)) {
    on<LoadingIndicatorEvent>((event, emit) async {
      await _onLoadingIndicatorEvent(event, emit);
    }, transformer: sequential());
  }
}

Future<void> _onLoadingIndicatorEvent(
    LoadingIndicatorEvent event, Emitter<LoadingState> emit) async {
  emit(LoadingState(loadingScreen: event.loading));
}
