import 'package:geocoding/geocoding.dart';

abstract class PlaceMarkUtils {
  Future<Placemark> getPlaceMarkFromCoordinates(double latitude, double longitude);
}

class PlaceMarkUtilsImpl implements PlaceMarkUtils {
  @override
  Future<Placemark> getPlaceMarkFromCoordinates(double latitude, double longitude) async {
    final marks = await placemarkFromCoordinates(latitude, longitude);
    return marks.first;
  }
}
