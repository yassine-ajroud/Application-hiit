import 'package:applicationhiit/controllers/signcontroller.dart';
import 'package:applicationhiit/values/colors.dart';
import 'package:applicationhiit/viows/screen/profile_screen.dart';
import 'package:applicationhiit/viows/widgets/botoun.dart';
import 'package:applicationhiit/viows/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:applicationhiit/viows/screen/signup_screen.dart';

import '../../controllers/authcontroller.dart';

class Signin extends StatelessWidget {
   Signin({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
        final _provider = Provider.of<AuthController>(context,listen: false);
        final _provider1 = Provider.of<AuthController>(context);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [         
                  Image.asset('assets/logo1.png',height: 60,),
                  const SizedBox(height: 20,),
               const   Text(style: TextStyle(
                    color:ConstColors.maincolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily:'Roboto',
                  ),"Bienvenue à nouveau"),
                  const SizedBox(height: 8,),
                      
               const Text(style: TextStyle(
                    color: ConstColors.maincolor,
                    fontFamily:'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,         
                  ),"S'identifier"),
                  const SizedBox(height: 15,),
                   InputText(hint: "Adresse Email",type: TextInputType.emailAddress,controler: _provider1.loginEmail,validator:(v)=> _provider.validEmail(v??""),),
                  const SizedBox(height: 6,),
                  InputText(hint: "Mot de passe",obs: Provider.of<SigninController>(context).obs,icon:Provider.of<SigninController>(context).icon,click: () => Provider.of<SigninController>(context,listen: false).visibilite(),controler: _provider1.liginPassword,validator:(v)=> _provider.validPassword(v??"")),
                  const SizedBox(height: 20,),
                  MyBottoun(text: 'connecter',click: () {
                             if(!_formKey.currentState!.validate()){
                                    return;
                      }                
                     _formKey.currentState!.save();
                    _provider.login(_provider1.loginEmail.text.toString(), _provider1.liginPassword.text.toString(), context);
                    
                  },),
                const   SizedBox(height: 10,),
                     const Text(style: TextStyle(
                    color: ConstColors.maincolor,
                    fontFamily:'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    
                
                  ),"Ou"),
                  const SizedBox(height: 10,),
                  MyBottoun(text: 'continuer avec google',click: () async{

                    await _provider.signInWithGoogle(context);
                    
                  },),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 12,),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Vous n'avez pas de compte,", textAlign: TextAlign.center),
                        TextButton(onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) =>  SignupScreen()));
                        }, child:const Text ('Inscrivez-vous ?',style: TextStyle(color: ConstColors.maincolor,fontWeight: FontWeight.bold),
                        ),
                    )],
                    ),
                  )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}