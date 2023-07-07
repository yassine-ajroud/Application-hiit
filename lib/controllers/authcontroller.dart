import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart';
import '../viows/screen/profile_screen.dart';

class AuthController with ChangeNotifier{
   List<FireUser> allusers=[];


  //create aacount
     TextEditingController uname =TextEditingController();
     TextEditingController eml =TextEditingController();
   TextEditingController psw=TextEditingController();
   TextEditingController cpsw =TextEditingController();
      TextEditingController number =TextEditingController();

  //login 
  TextEditingController loginEmail=TextEditingController();
   TextEditingController liginPassword =TextEditingController();

  String error="une erreur s'est produite";

    CollectionReference users = FirebaseFirestore.instance.collection('users');



//log into firabase with email and password  
Future<void> login(String email,String password,BuildContext ctx)async{
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) => const ProfileScreen()));                   
    print('logged in');
 } on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    error='Aucun utilisateur trouvé pour cet e-mail.';
  } else if (e.code == 'wrong-password') {
    error='Mauvais mot de passe fourni pour cet utilisateur.';
  }

Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
} }

//create new firabase account
Future<void> createAccount(String email,String password,String phone,String username)async{
try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  ).then((value) => {
     Fluttertoast.showToast(
        msg: "creation du compte",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    ),
     users
          .add({
            "id":value.user!.uid.toString(),
            "userName":username,
            "email":email,
            "phone":phone,
            "cars":[]
          })
          .then((value) => {
            Fluttertoast.showToast(
        msg: "compte créé avec succès",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    ),
    cpsw.clear(),eml.clear(),uname.clear(),number.clear(),psw.clear()
          })
          .catchError((error) => print("Failed to add user: $error"))
    
  });
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    error='The password provided is too weak.';
  } else if (e.code == 'email-already-in-use') {
    error='The account already exists for that email.';
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
} catch (e) {
  print(e);
}
}


Future<void> signInWithGoogle(BuildContext ctx) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
 final usr= await FirebaseAuth.instance.signInWithCredential(credential);
for(FireUser c in allusers){
  if(c.id == usr.user!.uid){
    return;
  }}
  await  users
          .add({
            "id":usr.user!.uid.toString(),
            "userName":usr.user!.displayName,
            "email":usr.user!.email,
            "phone":usr.user!.phoneNumber,
            "cars":[]
          }).then((value) => Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) =>  ProfileScreen()))
);
  
  
  }


//log out from firebase
Future<void> logout()async{
  await FirebaseAuth.instance.signOut();
  loginEmail.clear();liginPassword.clear();
  
}



Future<void> getAllUsers()async {
   QuerySnapshot querySnapshot = await users.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    allusers= allData.map((e) => FireUser.fromJSON(e as Map<String,dynamic>)).toList();

    print(allusers);
}





String ?validuserName(String v){
  if (v.isEmpty) 
                    return "nom d'utilisateur obligatoire";
}
String ?validEmail(String v){
  if (!v.contains("@gmail.com")||v.isEmpty) 
                    return "email n'est pas valide";
}
String ?validPassword(String v){
  if (v.length<8||v.isEmpty) 
                    return 'longeur minimale:8';
}
String ?validCPassword(String v,String v1){
  if (v.length<8||v.isEmpty||v!=v1) 
                    return 'le mot de passe ne correspond pas';
}
String ?validPhone(String v){
  if (v.length!=8||v.isEmpty || !phoneNumber(v)) 
                    return 'numéro de téléphone incorrect';
}
bool phoneNumber(String s){
  for (int i = 0; i < s.length; i++) {
    if((s.codeUnitAt(i)<48 && s.codeUnitAt(i)>57)){
      return false;
    }
  }
  return true;
}


}