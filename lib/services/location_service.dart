import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  Future<String> handlePermission() async {
    final test = await location.requestPermission().then(
      (permissionStatus) {
        if (permissionStatus == PermissionStatus.granted) return 'granted';
        if (permissionStatus == PermissionStatus.grantedLimited) {
          return 'granted';
        }
        if (permissionStatus == PermissionStatus.denied) return 'denied';
        if (permissionStatus == PermissionStatus.deniedForever) {
          return 'denied';
        }
      },
    );
    return test!;
  }
}
