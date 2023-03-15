import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rate_caculation/home/home_page.dart';


import '../model/utils/images.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 3), (){
      Get.to(HomePage());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Raet Calculation",style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.w800),),
            Center(
              child: Image.asset(Images.calcu2),
            ),
          ],
        ),
      ),
    );
  }
}
