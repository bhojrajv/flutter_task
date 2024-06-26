import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class ApiServices{
  //creating singletone
  static ApiServices? _intance;
  ApiServices._internal();
  factory ApiServices(){
    if(_intance==null){
     return _intance=ApiServices._internal();
    }else{
      return _intance??ApiServices();
    }
  }
  Future<dynamic>getCourses({int?limit,int?page})async{
    var jsonResponse;
    try{
      String?url="https://fakestoreapi.com/products?limit=${limit}&page=$page";
      final response=await http.get(Uri.parse(url));
      if(response.statusCode==200){
        jsonResponse=jsonDecode(response.body);
      }else{
        Get.snackbar("Error", "${response.statusCode} ${jsonResponse}");
      }
    }catch(ex){
      Get.snackbar("Error", "${ex.toString()}");
    }
    return jsonResponse;
  }
  Future<dynamic>getUserlogin({String?username,var sha256})async{
    try{
      var url=Uri.parse("https://apiv2stg.promilo.com/user/oauth/token");
      var request=http.MultipartRequest("POST",url);
      request.fields["username"]=username??"";
      request.fields["password"]=sha256.toString();
      request.fields["grant_type"]="password";
      request.headers["Authorization"]="Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==";
      var jsonresponse;
      //send request
     // log("fields:${request.fields}");
      var response=await request.send();
      //log("status:${response.statusCode}");
      if(response.statusCode==200){
        var resData=await response.stream.toBytes();
        var resString=String.fromCharCodes(resData);
        jsonresponse=jsonDecode(resString);
        return jsonresponse;
      }else{
        var resData=await response.stream.toBytes();
        var resString=String.fromCharCodes(resData);
        jsonresponse=jsonDecode(resString);
        log('msg:${jsonresponse}');
        return jsonresponse;
      }
    }catch(e){
      log('ex:${e.toString()}');
      return e.toString();
    }
  }
}