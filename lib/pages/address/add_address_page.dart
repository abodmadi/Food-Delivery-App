import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/controllers/location_controller.dart';
import 'package:food_delivery_app/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  var _addressController = TextEditingController();
  var _contactPersonNameController = TextEditingController();
  var _contactPersonNumberController = TextEditingController();
  late bool _isLoggedIn;

  // This showing the camera view and location in it (in this case the location is USA ),
  late LatLng _latLng;
  CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(45.51563, -122.677433),
    zoom: 17,
  );

  @override
  void initState() {
    super.initState();
    // This for cheek if the user is logged in or not and cheek if the user info is not empty.
    _isLoggedIn = Get.find<AuthController>().isUserLoggedIn();
    if (_isLoggedIn && Get.find<UserController>().userModel == Null) {
      Get.find<UserController>().getUserInfo();
    }
    // This for get the user saved address.
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      var latitude = Get.find<LocationController>().address['latitude'];
      var longitude = Get.find<LocationController>().address['longitude'];
      _cameraPosition = CameraPosition(
        target: LatLng(
          double.parse(latitude),
          double.parse(longitude),
        ),
      );
      _latLng = LatLng(
        double.parse(latitude),
        double.parse(longitude),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}
