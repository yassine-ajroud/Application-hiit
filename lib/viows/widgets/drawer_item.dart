import 'package:applicationhiit/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../controllers/drawer_controller.dart';
import '../../values/text_styles.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final String text; 
  final Widget route;
  const DrawerItem({required this.icon, required this.isSelected, required this.text,required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>route));
          Provider.of<DrawerProvider>(context,listen: false).activatePage(text);
          
        },

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        selected: isSelected,
        selectedTileColor: ConstColors.maincolorlight,
        leading: Icon(icon,color: isSelected ? Colors.white:Colors.grey,),
        title: Text(text,style: isSelected ? ConstTextStyles.drawerSelectedTextStyle : ConstTextStyles.drawerUnselectedTextStyle,),
      ),
    );
    
  }
}