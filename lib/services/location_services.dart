import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';

class LocationServices with ChangeNotifier {
  double? latitude;
  double? longitude;
  String? address;
  bool isLoading = false;
  final box = GetStorage();

  Future getCurrentLocation() async {
    try {
      isLoading = true;
      notifyListeners();

      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception("Location Service Disabled!");
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception("Location Permission Denied!");
        }
      }
      if (permission == LocationPermission.deniedForever) {
        throw Exception("Permission Permanently Denied");
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude = position.latitude;
      longitude = position.longitude;

      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude!,
        longitude!,
      );

      Placemark place = placemarks.first;
      address = "${place.locality}, ${place.country}";
      box.write('address', address);

    } catch (e) {
      address = "Error $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void loadSavedLocation(){
    address = box.read('address');
    notifyListeners();
  }

}
