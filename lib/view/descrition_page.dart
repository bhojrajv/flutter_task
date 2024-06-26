import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tas/Appconst/appcolors.dart';
import 'package:flutter_tas/view/common_widgets.dart';
import 'package:flutter_tas/viewmodel/courseController.dart';
import 'package:flutter_tas/viewmodel/services.dart';
import 'package:get/get.dart';

class DescriptionPage extends GetView<DashboardController> {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(elevation: 0,
          title: Text("Description",style: TextStyle(color: AppcColors.black,fontWeight: FontWeight.bold),),leading: InkWell(
             onTap: (){Get.back();}, child: Icon(Icons.arrow_back_ios,color: AppcColors.black,)),backgroundColor: AppcColors.white),
      body:  SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CommonCarousel(height: 350,flag: 'Des'),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Actor Name",style: TextStyle(color: AppcColors.black,fontWeight: FontWeight.bold,fontSize: 15),),
              ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Indian Actors",style: TextStyle(color: AppcColors.black,fontWeight: FontWeight.w400,fontSize: 15),),
              ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.share_arrival_time_outlined),
                    Text("   Duration 20 Mins",style: TextStyle(color: AppcColors.black,fontWeight: FontWeight.w400,fontSize: 14),),
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.wallet),
                    Text("   Total average Fee \u{20B9} 9999",style: TextStyle(color: AppcColors.black,fontWeight: FontWeight.w400,fontSize: 14),),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("About",style: TextStyle(color: AppcColors.black,fontWeight: FontWeight.bold,fontSize: 15),),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text("  This is a very long description text. It can span multiple lines and even paragraphs.\n"
                "To ensure that it is fully readable, we will use a SingleChildScrollView."
                "\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. "
                         ,style: TextStyle(color: AppcColors.black,fontWeight: FontWeight.w400,fontSize: 14),),
                    ),

                  ],
                ),
              ),
              Row( mainAxisAlignment: MainAxisAlignment.end,
                children: [ TextButton(onPressed: (){controller.seeMore();}, child: Text("See More",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),))],),
            Obx(
                ()=> controller.ismore.value==true?  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text( "Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum."
                      "\nNulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh. Qu",style: TextStyle(color: AppcColors.black,fontWeight: FontWeight.w400,fontSize: 14)),
                ):const SizedBox(),
            )
          ],),
        ),
  bottomNavigationBar:  BottomNavigationBar(
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
    ),
    );
  }
}
