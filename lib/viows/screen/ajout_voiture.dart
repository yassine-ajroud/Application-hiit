

import 'package:applicationhiit/controllers/car_controller.dart';
import 'package:applicationhiit/values/colors.dart';
import 'package:applicationhiit/viows/widgets/botoun.dart';
import 'package:applicationhiit/viows/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/drawer.dart';


class AjoutVoiture extends StatelessWidget {
 AjoutVoiture({super.key});
  TextEditingController _id = TextEditingController();
    final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        

           drawer:const MyDrawer(
        
      ),
      appBar: AppBar(automaticallyImplyLeading: false,
      
        elevation: 0, leading: Builder(
          builder: (ctx) {
            return IconButton (onPressed: () => Scaffold.of(ctx).openDrawer(), icon:Icon(Icons.menu),color: Colors.black,);
          }
        ),backgroundColor: ConstColors.transparence ,),
    
        
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(children: [
              ClipRRect(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(30) ), child: Image.asset("assets/taswera1.png",height: MediaQuery.of(context).size.height*0.55,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,)),
              const SizedBox(height: 20,),
              const Text("Ajoutez votre voiture",style: TextStyle(color: ConstColors.maincolor,fontWeight: FontWeight.bold,fontSize: 20),),
              const SizedBox(height:20,),
              
               InputText(hint: "voiture ID",controler: _id,validator: (v){
                if(v!.isEmpty){
                  return 'entrer un ID';
                }
               },),
              const SizedBox(height: 20,),
              MyBottoun(text: "Ajouter", click: ()async{
                        if(!_formKey.currentState!.validate()){
                                    return;
                      }                
                     _formKey.currentState!.save();
                await Provider.of<CarContoller>(context,listen: false).addCar(_id.text.toString()).then((value)async {
                  await Provider.of<CarContoller>(context,listen: false).getOwnedCars();
                });
                
              }),
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child:const Text("Annuler",style: TextStyle(color: ConstColors.maincolor,fontWeight: FontWeight.bold),)),
            ]),
          ),
        ),
      ),
    );
  }
}