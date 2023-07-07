import 'dart:io';

import 'package:applicationhiit/controllers/authcontroller.dart';
import 'package:applicationhiit/controllers/car_controller.dart';
import 'package:applicationhiit/values/colors.dart';
import 'package:applicationhiit/viows/screen/profile_screen.dart';
import 'package:applicationhiit/viows/screen/signin.dart';
import 'package:applicationhiit/viows/screen/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      children: [
        Image.asset('assets/image.png',fit: BoxFit.cover ,height: MediaQuery.of(context).size.height,),
        Positioned(
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.width,
            decoration:const BoxDecoration(
              color:ConstColors.maincolor,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(39),topRight:Radius.circular(39)),
                
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Image.asset('assets/logo.png',height: 60,),
                const SizedBox(height: 20,),
                const Text("Bienvenue sur notre application, vous pouvez \n protéger votre voiture en quelques clics.",style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: "Roboto",fontWeight: FontWeight.bold,),textAlign:TextAlign.center,),
              const SizedBox(height: 20,),
              SizedBox(
                width: 159,
                height: 35,
                child: ElevatedButton(onPressed: ()async{
                  FirebaseAuth.instance
  .userChanges()
  .listen((User? user) async {
    if (user == null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_) =>  Signin()));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_) => const ProfileScreen()));
    }
  });
  },
                  style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.white),shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(color: Colors.white)
                  )
                )), child: Text("Continue",style: TextStyle (color:ConstColors.maincolor,fontWeight: FontWeight.bold))
                ),
              ),
              const SizedBox(height: 8,),
              TextButton(onPressed: (){exit(0);}, child:const  Text("Annuler",style: TextStyle(color: Colors.white),))
              ]),
            ),
          ),
        )
      ],
    ),
    );
  }
}