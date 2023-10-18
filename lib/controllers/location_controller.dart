import 'package:food_delivery_app/data/repository/location_repo.dart';
import 'package:food_delivery_app/models/address_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  final LocationRepo locationRepo;
  LocationController({required this.locationRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // This showing our position in the map.
  late Position _position;
  // This showing the saved position on the map (picked position).
  late Position _pickPosition;

  Placemark _placeMark = Placemark();
  Placemark _pickPlaseMark = Placemark();

  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;

  late List<AddressModel> _allAddresses = [];
  List<AddressModel> get allAddresses => _allAddresses;

  List<String> _addressTypeList = ['home', 'office', 'other'];
  int _addressTypeIndex = 0;

  Map<String, dynamic> _address = <String, dynamic>{};
  Map<String, dynamic> get address => _address;

  late GoogleMapController _mapController;
  set setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  GoogleMapController get mapController => _mapController;

  bool _updateAddressData = true;
  bool get updateAddressData => _updateAddressData;
  bool _changeAddress = true;
  bool get changeAddress => _changeAddress;

  late CameraPosition _cameraPosition;
  CameraPosition get cameraPosition => _cameraPosition;

  updatePosition(CameraPosition cameraPosition, bool fromAddAddress) async {
    if (_updateAddressData) {
      _isLoading = true;
      update();
      try {
        if (fromAddAddress) {
          _position = Position(
            longitude: cameraPosition.target.longitude,
            latitude: cameraPosition.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            altitudeAccuracy: 1,
            headingAccuracy: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        } else {
          _pickPosition = Position(
            longitude: cameraPosition.target.longitude,
            latitude: cameraPosition.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            altitudeAccuracy: 1,
            headingAccuracy: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        }
        // This for toking with a server app and server toked with google server.
        if (_changeAddress) {
          String _address = await getAddressFromGeoCode(
            LatLng(
              cameraPosition.target.latitude,
              cameraPosition.target.longitude,
            ),
          );
        } else {}
      } catch (ex) {
        print(ex);
      }
    }
    //_cameraPosition = cameraPosition;
    //_updateAddressData = fromAddAddress;
  }

  Future<String> getAddressFromGeoCode(LatLng latLng) async {
    String _address = 'Unknown location found';
    print("latlng:" + latLng.toString());
    Response response = await locationRepo.getAddressFromGeoCode(latLng);
    print("Location Body"+response.body.toString());
    if (response.body['status'] == "OK") {
      _address = response.body['results'][0]['formatted_address'].toString();
      print("your address " + _address);
    } else {}
    return _address;
  }
}
