import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tas/model/HomeDashboard.dart';
import 'package:get/get.dart';
import 'package:flutter_tas/viewmodel/services.dart';

class DashboardController extends GetxController{
  final ApiServices apiServices;
  final RxList<HomeDashboard>_courselist=<HomeDashboard>[].obs;
   RxSet<HomeDashboard>new_course=<HomeDashboard>{}.obs;
  RxBool hasMoreData = true.obs;

  final int limit=5;
  RxInt page=1.obs;
  final ScrollController scrcontroller=ScrollController();
  DashboardController({required this.apiServices});

  List<HomeDashboard>getCourses()=>_courselist.value;

  @override
  void onInit() {
    // TODO: implement onInit
    _courselist.clear();
    new_course.clear();
    super.onInit();
    getImg();
    fetchCourse(limit: limit);
    scrcontroller.addListener(() {
      if(scrcontroller.position.pixels==scrcontroller.position.maxScrollExtent){
        fetchCourse(limit: limit*page.value);
        log("addlistener2");
      }
    }) ;
  }
  //fetching courses
  RxBool isloading=false.obs;
 Future<void>fetchCourse({required int limit})async{
  // _courselist.value.clear();
   //new_course.value.clear();
   if (isloading.value) return; // Prevent multiple simultaneous requests
   isloading(true);
   var courseRes=await apiServices.getCourses(limit: limit,page:page.value);
  if(courseRes.isEmpty){
  hasMoreData(false);
  }else{
    for(var course in courseRes){
      //new_course.add(HomeDashboard.fromJson(course));
    }
   /* if(new_course.value.length<limit){
      hasMoreData(false);
    }else{*/
      _courselist.value.addAll(new_course.value.where((element) => !_courselist.contains(element)));
      page.value++;
   // }

    isloading(false);
  }
   update();
 }
 RxList<Widget>imagelist=<Widget>[].obs;
 RxList<Widget>meetupimg=<Widget>[].obs;
 void getImg(){
  imagelist.value=List.generate(3, (index) => Container());
  meetupimg.value.add(Image.asset('assets/meet.jpeg', fit: BoxFit.cover,width: Get.width/1));
  meetupimg.value.add(Image.asset('assets/meet2.jpeg', fit: BoxFit.cover,width: Get.width/1,));
  meetupimg.value.add(Image.asset('assets/meet3.jpeg', fit: BoxFit.cover,width: Get.width/1,));
//  Image.asset('assets/meet.jpeg', fit: BoxFit.cover,width: Get.width/1,)
 }
 RxInt changeIndx=0.obs;
 void onPage({int? indx}){
   changeIndx.value=indx??0;
   update();
 }
  RxInt initIndx=2.obs;
 void currenIndx({int?indx}){
   initIndx.value=indx??2;
   update();
 }
 RxBool ismore=false.obs;
 void seeMore(){
   ismore.value=!ismore.value;
   update();
 }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrcontroller.dispose();
  }
}