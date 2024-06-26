
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpcontroller extends GetxController{
  RxBool isSignup=false.obs;
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  //makeing user signup
  Future<String?> userSignup({
    required String email,
    required String password,
  }) async {
    try {
      isSignup(true);
      Get.snackbar("message", "you have sign up successfully");
      return 'Success';
    } catch (e) {
      isSignup(false);
      return e.toString();
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }
}