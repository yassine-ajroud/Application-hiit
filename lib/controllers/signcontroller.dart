import 'package:flutter/material.dart';
class SigninController with ChangeNotifier {
  bool check = false;
  IconData icon = Icons.visibility;
  bool obs = true;
  void checking (c){
    check = c;
    notifyListeners();
  }
  void visibilite (){
    if(obs){
      obs=false;
      icon=Icons.visibility_off;
    }else{
      obs=true;
      icon=Icons.visibility;
    }notifyListeners();
  } 
}