import 'package:flutter/material.dart';
import 'package:flutter_tas/Appconst/appcolors.dart';
import 'package:flutter_tas/view/auth/login_screen.dart';
import 'package:flutter_tas/viewmodel/initBinding.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(color: AppcColors.txtgrey,
      title: 'Flutter Demo',
      theme: ThemeData(backgroundColor: AppcColors.txtgrey,
        colorScheme: ColorScheme.fromSeed(seedColor: AppcColors.white,background: AppcColors.white,onBackground: AppcColors.white),
        useMaterial3: false,primaryColor: AppcColors.txtgrey,
      ),
      home: const Loginscreen(),
      initialBinding: InitiBinding(),
    );
  }
}


