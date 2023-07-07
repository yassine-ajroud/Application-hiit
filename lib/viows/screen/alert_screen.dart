import 'dart:io';

import 'package:applicationhiit/values/colors.dart';
import 'package:applicationhiit/viows/widgets/botoun.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ColorFiltered(colorFilter: const ColorFilter.mode(Color.fromARGB(235,81,85,126), BlendMode.modulate), child: Image.asset("assets/taswera3.png",height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,)),
      Center(
        child: Container(decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(25),
        ),
        height:MediaQuery.of(context).size.height*0.35,
        width:MediaQuery.of(context).size.width*0.8,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
           Image.asset("assets/alert.png",height: 70,),
           const SizedBox(height: 15,),
           Text("votre voiture est volée, vous devez \n agir immédiatement",style: TextStyle(color: ConstColors.maincolor,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
           const SizedBox(height: 15,),
           MyBottoun(text: "OK", click: (){exit(0);
            
           })
          ]),
      
        ),
      )
      ],
        
      ),
    );
  }
}