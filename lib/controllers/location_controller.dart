import 'package:food_delivery_app/data/repository/location_repo.dart';
import 'package:food_delivery_app/models/address_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

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
}
