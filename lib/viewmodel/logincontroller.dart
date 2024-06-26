
import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tas/viewmodel/services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  RxBool islogin=false.obs;
 RxBool isToggle=false.obs;
 RxBool isbutton=false.obs;
 RxBool isRemember=false.obs;
 final ApiServices? servies;
  LoginController({this.servies});

 final TextEditingController emaillogin=TextEditingController();
 final TextEditingController passlogin=TextEditingController();

  Future<String?> userlogin({
    required String email,
    required String password,
  }) async {
    try {
      islogin(true);
      islogin(false);
      return 'Success';
    }  catch (e) {
      islogin(false);
      return e.toString();
    }
  }
  void isButtonToggle(){
    if(passlogin.text.isEmpty){
      isbutton.value=false;
    }else{
      isbutton.value=true;
    }
    update();
  }

  void isTogglePass(){
    isToggle.value=!isToggle.value;
    update();
  }
  void rememBerme(){
    isRemember.value=!isRemember.value;
    update();
  }
  RxString message="".obs;
  RxString code="".obs;
Future<Map<String,dynamic>>authUser({String?user,String?pass})async{
  log("cred:${user}/${pass}");
  var map=Map<String,dynamic>();
  try{
    islogin.value=true;
    var bytes1 = utf8.encode("${pass}");         // data being hashed
    var shA256pss = sha256.convert(bytes1);
    log("sha:${shA256pss}");
    var res=await servies?.getUserlogin(username: user,sha256: shA256pss);
   // log('code2:${res["status"]["messagef"]}');
   // log("authres:${res}");
   // message.value=res["status"]["message"];
   // code.value=res["status"]["code"].toString();
    islogin.value=false;

    if(res["status"]["code"]==200){
      map["code"]=res["status"]["code"].toString();
    }else{
      if(res["status"]["message"]!=null){
        map["message"]=res["status"]["message"].toString();
      }
    }

    return map;
    update();
  }catch(ex){
    islogin.value=false;
    map["message"]=ex.toString();
    return map;
  }
   update();
}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emaillogin.dispose();
    passlogin.dispose();
  }
}