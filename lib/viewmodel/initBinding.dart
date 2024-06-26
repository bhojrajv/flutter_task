import 'package:get/get.dart';
import 'package:flutter_tas/viewmodel/courseController.dart';
import 'package:flutter_tas/viewmodel/logincontroller.dart';
import 'package:flutter_tas/viewmodel/services.dart';
import 'package:flutter_tas/viewmodel/signupcontroller.dart';

class InitiBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DashboardController(apiServices: ApiServices()));
    Get.lazyPut(() => SignUpcontroller());
    Get.lazyPut(() => LoginController(servies: ApiServices()));
    Get.create(() => LoginController(servies: ApiServices()));
  }

}