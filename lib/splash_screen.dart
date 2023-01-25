import 'dart:async';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:phone_verification/phone.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String finalPhone;

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration (seconds: 3),() =>Get.to(MyPhone()));
    super.initState();
  }
  // Future getValidationData() async{
  //   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var obtainPhone = sharedPreferences.getString('phone');
  //   setState(() {
  //     finalPhone= obtainPhone!;
  //   });
  //   print(finalPhone);
  // }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Icon(Icons.local_activity),
              radius: 50,
            ),

          ],
        ),
      ),
    );
  }
}
