import 'package:flutter/material.dart';
import 'package:flutter_tas/model/HomeDashboard.dart';
import 'package:get/get.dart';
import 'package:flutter_tas/Appconst/appcolors.dart';
import 'package:flutter_tas/view/auth/sing_up.dart';
import 'package:flutter_tas/view/common_textfield.dart';
import 'package:flutter_tas/view/meetup.dart';
import 'package:flutter_tas/viewmodel/logincontroller.dart';


class Loginscreen extends GetView<LoginController> {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: Icon(Icons.arrow_back_ios,color: AppcColors.textcolor,),backgroundColor: AppcColors.light_grey, elevation: 0),
      backgroundColor: AppcColors.light_grey,
      body: Obx(
        ()=> SingleChildScrollView(
          child: Container(alignment: Alignment.center,padding: EdgeInsets.all(5.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [ Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), color: AppcColors.white,shadowColor: AppcColors.white,borderOnForeground: true, elevation: 2,child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Text("Promilo",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  SizedBox(height: Get.height/11,),
                  Text("Hi Welcome Back!",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  TextFieldForms(controller:controller.emaillogin,hint: "Email",label: "Please Sign in to continue",icons: Icon(Icons.email,color:Colors.grey ,)),
                  SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Sign In With OTP",style: TextStyle(color: AppcColors.blue,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  TextFieldForms( onChange: (v){
                    controller.isButtonToggle();
                  },  toggleEye:controller.isToggle.value , controller:controller.passlogin ,label: "Password",hint: 'Password',icons: Icon(Icons.lock,color:Colors.grey ,),flag: "pass",sufix: InkWell(onTap: (){
                    controller.isTogglePass();
                  }, child:controller.isToggle.value?Image.asset("assets/eye.png",scale: 7.0,):Icon(Icons.remove_red_eye_sharp))),
                  SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Row(children: [Checkbox(value: controller.isRemember.value, onChanged: (v){
                      controller.rememBerme();
                    }),Text("Remember me")],),
                      Text("Forgot Password?",style: TextStyle(color: AppcColors.blue,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  SizedBox(height: 10,),
                controller.islogin.value==true?Center(child: CircularProgressIndicator(),) : TextButton(onPressed:controller.isbutton.value==true ?()async{
                  const pattern = r'^[^@]+@[^@]+\.[^@]+';
                  final regex = RegExp(pattern);
                  if (!regex.hasMatch(controller.emaillogin.text)) {
                     Get.snackbar("email", 'Enter a valid email address');
                  }else{
                    await controller.authUser(user: controller.emaillogin.text, pass: controller.passlogin.text).then((value){
                      print("on screen:${value["message"]}");
                      if(value["code"]=="200"){
                        Get.to(()=>IndivisualMeet());
                      }else{
                        Get.snackbar("error", value["message"]??"");
                      }
                    });
                  }
                 }:(){Get.snackbar("error", "Enter your password");}, child: Text("Submit",style: TextStyle(color: AppcColors.white),),style: ButtonStyle(backgroundColor: controller.isbutton.value==true? MaterialStateProperty.all(AppcColors.red):MaterialStateProperty.all(AppcColors.red.withOpacity(.2)), minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width/1,45)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),),
                  SizedBox(height: 10,),
    ],),
              ),),
            ),Text("or"),
             const SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset("assets/google.png",height: 40,width: 40,fit: BoxFit.contain,),
                  const SizedBox(width: 10,),
                  Image.asset("assets/linkeding.png",height: 30,width: 30,fit: BoxFit.contain,),
                  const SizedBox(width: 10,),
                  Image.asset("assets/fb.png",height: 40,width: 40,fit: BoxFit.contain,),
                  const SizedBox(width: 10,),
                  Image.asset("assets/insta.jpeg",height: 40,width: 40,fit: BoxFit.contain,),
                  const SizedBox(width: 10,),
                  Image.asset("assets/whatsapp.jpeg",height: 40,width: 40,fit: BoxFit.contain,)],),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Business User?",style: TextStyle(fontSize: 15)),SizedBox(width: 5,),InkWell(onTap: (){Get.to(()=>SignupScreen());}, child: Text( "Do not have an account?",style: TextStyle(fontSize: 15, color: AppcColors.textcolor,fontWeight: FontWeight.w500)))
                ],
            ),
              ),
              const SizedBox(height:8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Login here",style: TextStyle(fontSize: 15,color: AppcColors.blue,fontWeight: FontWeight.w500)),SizedBox(width: 5,),InkWell(onTap: (){Get.to(()=>SignupScreen());}, child: Text( "Sign Up",style: TextStyle(fontSize: 15,color: AppcColors.blue,fontWeight: FontWeight.w500)))
                  ],
                ),
              ),
              const SizedBox(height:20,),
              Text("By continue you agree to"),
              const SizedBox(height: 5,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Promilo's"),const SizedBox(width: 5,),Text("Terms of User & Policy",style: TextStyle(color: AppcColors.black,fontWeight: FontWeight.w600),),],),
              const SizedBox(height: 10,),
              Container(height: 5,decoration: BoxDecoration(color: AppcColors.black.withOpacity(.2)),width: Get.height/6,)
            ],),),
        ),
      ),);
  }
}
