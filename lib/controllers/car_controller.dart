import 'package:applicationhiit/models/car_model.dart';
import 'package:applicationhiit/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarContoller with ChangeNotifier{
  List<Car> ownedCars=[];
  String docid="";


  CollectionReference cars = FirebaseFirestore.instance.collection('cars');
  CollectionReference users = FirebaseFirestore.instance.collection('users');



Future<List<Map<String,dynamic>>> getAllUsers()async {
   QuerySnapshot querySnapshot = await users.get();
   List<Map<String,dynamic>> usrs=[];
    final allData = querySnapshot.docs;
    for(QueryDocumentSnapshot<Object?>  o in allData){
      usrs.add({
          'id':o.reference.id,
          'data':FireUser.fromJSON(o.data() as Map<String,dynamic>)
      });
    }    
    print(usrs);
    return usrs;    

    }

Future<List<Car>> getAllCars()async {
   QuerySnapshot querySnapshot = await cars.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    final allcars= allData.map((e) => Car.fromJSON(e as Map<String,dynamic>)).toList();
    print(allcars);
    
    for (Car c in allcars){
  Reference ref = 
        FirebaseStorage.instance.ref().child("images/${c.image}");
    String url = (await ref.getDownloadURL()).toString();
    c.image=url.toString();
}
return allcars;
}

Future<FireUser> getCurrentUser() async{
  final allusrs= await getAllUsers();
  late FireUser currentusr;
  for(Map<String,dynamic>u in allusrs){
    if(u['data'].id.toString()==FirebaseAuth.instance.currentUser!.uid.toString()){
      currentusr = u['data'];
      docid = u['id'];
        print('id $docid');
        print('cuser $currentusr');
        print('uid ${FirebaseAuth.instance.currentUser!.uid.toString()}');
    }
  }
        return currentusr;

}

Future<void> getOwnedCars() async{
  final usr=await getCurrentUser();
  final cars=await getAllCars();
     ownedCars= cars.where((element) => usr.cars.contains(element.id)).toList();
     print('ownedCars   $ownedCars');
     return;
}

Future<void> deleteCar(String carid)async{
      final usr=await getCurrentUser();
      print('before ${usr.cars}');

  usr.cars.remove(carid);
      print('after ${usr.cars}');

FirebaseFirestore.instance.collection('users').doc(docid).update({'cars':usr.cars }).then((value) => 
Fluttertoast.showToast(
        msg: "voiture supprimée",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    )
);
//await getOwnedCars();
notifyListeners();
}

Future<void>addCar(String carID)async{
    final usr=await getCurrentUser();
    final cars=await getAllCars();

//print(usr.cars);
if(usr.cars.contains(carID)){
Fluttertoast.showToast(
        msg: "voiture déja existe",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
    return;
}else
{
     Fluttertoast.showToast(
        msg: "chargement...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
  for(Car c in cars){
    //print(c.id);
    if(c.id==carID){
      //print("true");
   
    usr.cars.add(carID);
FirebaseFirestore.instance.collection('users').doc(docid).update({'cars':usr.cars }).then((value) => 
Fluttertoast.showToast(
        msg: "voiture ajoutée",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    )
);
notifyListeners();
return;
    }}
Fluttertoast.showToast(
        msg: "ID invalide",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
}
}
}