import 'dart:async';

import 'package:applicationhiit/values/colors.dart';
import 'package:applicationhiit/viows/screen/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();

}
class _SplashScreenState extends State<SplashScreen>{
  @override
 void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_) => const WelcomeScreen()));
  });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ConstColors.maincolor,
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const SizedBox(height: 20,),
          Image.asset('assets/logo.png',height: 100,),
          const SizedBox(height: 30,),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          
          
          ),
          const SizedBox(height: 20,),
          const Text("Chargement",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)
          
          
        ],
        ),
      ),
      

    );
  }
}
