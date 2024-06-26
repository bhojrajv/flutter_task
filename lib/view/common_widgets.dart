import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tas/Appconst/appcolors.dart';
import 'package:flutter_tas/viewmodel/courseController.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class CommonCarousel extends GetView<DashboardController> {
  final double? height;
  final String? flag;
  const CommonCarousel({this.flag,this.height,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(margin: EdgeInsets.zero,
        child: Column(
          children: [
            CarouselSlider(
              items:IndividualMeet(),
              options: CarouselOptions(
                onPageChanged: (ind,carousel){
                  //log("int:$ind");
                  controller.onPage(indx: ind);
                },
                height: height,
                enlargeCenterPage: true,
                autoPlay: false,
                //aspectRatio: 16 / 11,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: .98,
              ),
            ),
            flag=="Des"? SizedBox(): const SizedBox(height: 10,),
           flag=="Des" ?Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8.0),
             child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [Icon(Icons.cloud_download_outlined,size: 30,),
              Image.asset('assets/save.jpeg',width: 45,height: 45,fit: BoxFit.contain,),
                 Image.asset('assets/heart.jpeg',width: 50,height: 50,fit: BoxFit.contain,),
                 Icon(Icons.crop_free_outlined,size: 30,),Icon(Icons.star_border_rounded,size: 30,),
                 InkWell(onTap: ()async{
                   final result = await Share.share('check out my website https://example.com');
                       // log("result:${result}");
                   /*if (result == ShareResultStatus.success) {
                     print('Thank you for sharing my website!');
                   }*/
                 },
                     child: Icon(Icons.share,size: 30,)),],),
           ): SizedBox(height: 20,
              child:dotwdg() ,
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
  List<Widget> IndividualMeet(){
    controller.imagelist.value=List.generate(3, (index) => Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Stack(
          children: <Widget>[controller.meetupimg.value[index],
            //Image.asset('${controller.meetupimg.value[i]}', fit: BoxFit.cover,width: Get.width/1,),
            Positioned(
              bottom: Get.height*.04,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: flag=="Des" ?Align(alignment: Alignment.center,
                  child: SizedBox(height: 20,
                    child: dotwdg(),
                  ),
                ): Text(
                  'Popular Meetups in India',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    ));
    return controller.imagelist.value ;
  }
  Widget dotwdg(){
    return ListView.builder(itemBuilder: (context,index){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4),
        child: Obx(
              ()=> Container(width: 10,height: 10,decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0),
              color:controller.changeIndx.value==index?AppcColors.black: Colors.grey)),
        ),
      );
    },scrollDirection: Axis.horizontal,shrinkWrap: true,itemCount: 3,);
  }
}




