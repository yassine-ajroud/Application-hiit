import 'package:applicationhiit/viows/widgets/drawer.dart';
import 'package:applicationhiit/viows/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../values/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (ctx,i)=>MyNotificationitem(),itemCount: 3,),
      drawer: MyDrawer(
        
      ),
      appBar: AppBar(automaticallyImplyLeading: false,
        elevation: 0, leading: Builder(
          builder: (ctx) {
            return IconButton (onPressed: () => Scaffold.of(ctx).openDrawer(), icon:Icon(Icons.menu),color: Colors.black,);
          }
        ),backgroundColor: ConstColors.transparence ,),
    );
  }
}