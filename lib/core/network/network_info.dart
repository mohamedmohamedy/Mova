import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class BaseNetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfo implements BaseNetworkInfo {
  InternetConnectionChecker deviceStatus;

  NetworkInfo(this.deviceStatus);

  @override
  Future<bool> get isConnected => deviceStatus.hasConnection;
}
