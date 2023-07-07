import 'package:applicationhiit/controllers/authcontroller.dart';
import 'package:applicationhiit/viows/screen/signin.dart';
import 'package:applicationhiit/viows/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';


import '../../controllers/signcontroller.dart';
import '../../values/colors.dart';
import '../widgets/botoun.dart';
import '../widgets/input.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthController>(context,listen: false);
        final provider1 = Provider.of<AuthController>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,),
              child: Form(
                key: _formKey,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [         
                    Image.asset('assets/logo1.png',height: 60,),
                    const SizedBox(height: 20,),
                    const Text(style: TextStyle(
                      color:ConstColors.maincolor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily:'Roboto',
                    ),"Commencez"),
                    const SizedBox(height: 8,),
                        
                 const Text(style: TextStyle(
                      color: ConstColors.maincolor,
                      fontFamily:'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,         
                    ),"s'inscrire"),
                    const SizedBox(height: 6,),
                     InputText(hint: "Nom d’utilisateur",controler: provider1.uname,validator: (v)=>provider.validuserName(v??""),),
                    const SizedBox(height: 6,),
                     InputText(hint: "Adresse Email",type: TextInputType.emailAddress,controler: provider1.eml,validator: (v)=>provider.validEmail(v??"")),
                    const SizedBox(height: 6,),
                     InputText(hint: "Télephone",type: TextInputType.phone,controler: provider1.number,validator: (v)=>provider.validPhone(v??""),length: 8,),
                    const SizedBox(height: 6,),
                    InputText(hint: "Mot de passe",obs: Provider.of<SigninController>(context).obs,icon:Provider.of<SigninController>(context).icon,click: () => Provider.of<SigninController>(context,listen: false).visibilite(),controler: provider1.psw,validator: (v)=>provider.validPassword(v??""),),
                    const SizedBox(height: 6,),
                    InputText(hint: "Confirmer Mot de passe",obs: Provider.of<SigninController>(context).obs,icon:Provider.of<SigninController>(context).icon,click: () => Provider.of<SigninController>(context,listen: false).visibilite(),controler: provider1.cpsw,validator: (v)=>provider.validCPassword(v??"",provider1.psw.text.toString()),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 1,),
                      child: Row(
                      children:[
                        
                        Checkbox(activeColor: ConstColors.maincolor, shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),value:Provider.of<SigninController>(context).check, onChanged:(value)=>Provider.of<SigninController>(context,listen: false).checking(value),
                        
                        
                          
                         ),
                        const Text("J'ai lu et j'accepte"),
                        TextButton(onPressed: (){
                          showDialog(context: context, builder: (_) =>const MyDialog());
                        }, child: Text ("les termes et les conditions.",style: TextStyle(color: ConstColors.maincolor,fontWeight: FontWeight.bold),),)
                          
                        
                        
                      
                    ],),
                    ),
                    MyBottoun(text: 'Enregistrer',click: () async{
                                  if(!_formKey.currentState!.validate()){
                                    return;
                      }        
                      if(!Provider.of<SigninController>(context,listen: false).check){
Fluttertoast.showToast(
        msg: "tu dois accepter les terms et les conditions",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
    return;
                      }         
                           _formKey.currentState!.save();

                     await provider.createAccount(provider1.eml.text.toString(), provider1.psw.text.toString(), provider1.number.text.toString(), provider1.uname.text.toString());

                    },),
                   
                      
                    const SizedBox(height: 1,),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6,),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Connecter a votre compte,", textAlign: TextAlign.center),
                          TextButton(onPressed: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Signin()));
                          }, child:const Text ("S'identifier ?",style: TextStyle(color: ConstColors.maincolor,fontWeight: FontWeight.bold),
                          ),
                      )],
                      ),
                    )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}