part of 'internet_connect_cubit.dart';
enum InternetType{
  online,
  offline,
  unknown,
}
@immutable
class InternetConnectState {
final InternetType type;

  InternetConnectState({this.type = InternetType.unknown});
}


