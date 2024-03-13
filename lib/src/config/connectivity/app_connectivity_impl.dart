import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rock_weather/src/config/connectivity/app_connectivy.dart';

class AppConnectivityImpl implements AppConnectivity {
  final Connectivity _connectivity;

  AppConnectivityImpl(this._connectivity);

  @override
  Future<bool> isOnline() async {
    var connectivityResult = await (_connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
