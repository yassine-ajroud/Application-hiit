import 'package:applicationhiit/controllers/authcontroller.dart';
import 'package:applicationhiit/controllers/car_controller.dart';
import 'package:applicationhiit/controllers/signcontroller.dart';
import 'package:applicationhiit/viows/screen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'controllers/drawer_controller.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CarContoller()),
      ChangeNotifierProvider(create: (context) => AuthController()),
      ChangeNotifierProvider(create: (context) => SigninController()),
      ChangeNotifierProvider(create: (context) => DrawerProvider())
    ],
   
    child:  MyApp()));
}

class MyApp extends StatelessWidget {
  static const channel=  MethodChannel("lightacademy/getinfos");
  listenForRobbery()async{
    try{
      await channel.invokeMethod("listenForRobbery");

    }on PlatformException catch(e){
      print(e.toString());
    }
  }


  @override

  Widget build(BuildContext context) {
    listenForRobbery();
    return  MaterialApp (
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
    scaffoldBackgroundColor: Colors.white 
      ),

    );
  }
}

