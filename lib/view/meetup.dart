import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tas/view/descrition_page.dart';
import 'package:flutter_tas/viewmodel/courseController.dart';
import 'package:flutter_tas/viewmodel/services.dart';
import 'package:get/get.dart';
import 'package:flutter_tas/Appconst/appcolors.dart';

import 'common_widgets.dart';
class IndivisualMeet extends GetView<DashboardController> {
  const IndivisualMeet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DashboardController(apiServices: ApiServices()));
    return Scaffold (backgroundColor: AppcColors.txtgrey, appBar:  AppBar(centerTitle: true, title: Text("Individual Meetup",style: TextStyle(color: AppcColors.textcolor,fontWeight: FontWeight.bold), ), leading: InkWell(onTap: (){ Get.back();}, child: Icon(Icons.arrow_back_ios,color: AppcColors.textcolor,)),backgroundColor: AppcColors.white, elevation: 0),
    body:  SingleChildScrollView(
        child: Column(
          children: [
            // Search Bars
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1.5,color: AppcColors.black),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
              ),
            ),

            // Carousel
            CommonCarousel(height: 230.0),

            // Trending Popular People
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Trending Popular People', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){Get.to(()=>DescriptionPage());},
                    child: Container(
                      height: 185,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            width: Get.width/1.25,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: AppcColors.light_grey,width: 2)),
                            margin: EdgeInsets.only(right: 10),
                            child: Card(elevation: 0,shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: AppcColors.textcolor.withOpacity(.4)), borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0,top: 10.0,right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 40,width: 40,
                                          child: Image.asset('assets/auth2.png',fit: BoxFit.contain,width: 20,height: 20,scale:.3 ,) ,
                                          decoration: BoxDecoration(border: Border.all(width: 1,color: AppcColors.textcolor),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                              child: Text('Author Name', style: TextStyle(fontWeight: FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                              child: Text('1000 Meetups'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Divider(height: 1,color: AppcColors.black.withOpacity(.4),thickness: 1,),
                                    const SizedBox(height: 10,),
                                    Stack(alignment: Alignment.centerLeft,
                                      fit: StackFit.loose,
                                       clipBehavior: Clip.none,
                                      children: [
                                        Positioned(
                                          child: SizedBox(height: 30,width: 70,
                                            child: TextButton(
                                             style:ButtonStyle(backgroundColor: MaterialStateProperty.all(AppcColors.blue)),
                                               onPressed: () {
                                                log("on click");
                                                Get.to(()=>DescriptionPage());
                                              },
                                              child: Text('See More',style: TextStyle(fontSize: 12,color: AppcColors.white),),
                                            ),
                                          ),top: 65,left: Get.width*.53,
                                        ),
                                      ClipOval(child: Image.asset('assets/meet.jpeg',width: 60,height: 60,fit: BoxFit.cover,)),
                                        Positioned(left: 40,
                                            child: ClipOval(child: Image.asset('assets/meet2.jpeg',width: 60,height: 60,fit: BoxFit.cover,))),
                                        Positioned(left: 80,
                                            child: ClipOval(child: Image.asset('assets/meet3.jpeg',width: 60,height: 60,fit: BoxFit.cover,))),
                                        Positioned(left: 120,
                                            child: ClipOval(child: Image.asset('assets/meet3.jpeg',width: 60,height: 60,fit: BoxFit.cover,))),
                                        Positioned(left: 160,
                                            child: ClipOval(child: Image.asset('assets/meet3.jpeg',width: 60,height: 60,fit: BoxFit.cover,))),


                                    ],)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                ],
              ),
            ),

            // Top Trend Meet Up
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Top Trend Meet Up', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Container(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          width: Get.width/1,
                          margin: EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/meet3.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indx){
          controller.currenIndx(indx: indx);
        },
        unselectedIconTheme: IconThemeData(color: AppcColors.black),
        selectedIconTheme: IconThemeData(color: AppcColors.blue),
        selectedItemColor: AppcColors.blue,unselectedItemColor: AppcColors.black,
        currentIndex: controller.initIndx.value,selectedLabelStyle: TextStyle(color: AppcColors.blue.withOpacity(.4),fontStyle: FontStyle.normal,
      decorationStyle: TextDecorationStyle.wavy),
        showUnselectedLabels: true,showSelectedLabels: true,
        unselectedLabelStyle: TextStyle(color: AppcColors.black,decorationColor: AppcColors.black),
        elevation: 2,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.group,), label: 'Meetup'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),);
  }



}



