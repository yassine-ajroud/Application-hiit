import 'package:flutter/material.dart';

class DrawerProvider with ChangeNotifier{
  bool homeActivated=true;
  bool notificationactivited=false;
  

  void activatePage(String name){

    if(name == 'Accueil'){
homeActivated=true;
                  notificationactivited =false;
                  
    }else {
homeActivated=false;
                  notificationactivited =true;
                  
    }
    notifyListeners();
  }
}