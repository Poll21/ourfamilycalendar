part of 'loading_bloc.dart';

@immutable
abstract class LoadingEvent {}

class LoadingIndicatorEvent extends LoadingEvent{
  final bool loading;

  LoadingIndicatorEvent(this.loading);
}