import 'package:applicationhiit/controllers/authcontroller.dart';
import 'package:applicationhiit/values/colors.dart';
import 'package:applicationhiit/viows/screen/notifications.dart';
import 'package:applicationhiit/viows/screen/profile_screen.dart';
import 'package:applicationhiit/viows/screen/signin.dart';
import 'package:applicationhiit/viows/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../controllers/drawer_controller.dart';
import '../../values/text_styles.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (ctx) {
        return Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(children: [
              Image.asset("assets/logo1.png",fit: BoxFit.cover,height:70,),
              const SizedBox(height: 20,),
            const  Divider(color: ConstColors.maincolor),
              const SizedBox(height: 20,),
              DrawerItem(icon: Icons.home, isSelected: Provider.of<DrawerProvider>(ctx).homeActivated, text: "Accueil", route: ProfileScreen()),
              const SizedBox(height: 3,),
              DrawerItem(icon: Icons.notifications, isSelected: Provider.of<DrawerProvider>(ctx).notificationactivited, text: "Notifications", route: NotificationScreen()),
              
              Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ListTile( 
                    /*this line */  onTap: ()async{ await Provider.of<AuthController>(context,listen:false).logout().then((value) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Signin()));

                    });
                    },   /*this line */ 
                   
                    leading: Icon(Icons.logout_outlined,color: ConstColors.redColor,),
                    title: Text('Déconnexion',style: ConstTextStyles.drawerLogoutTextStyle)),
                 )

          
            ],),
          ),
        );
      }
    );
  }
}