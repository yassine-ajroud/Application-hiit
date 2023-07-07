import 'package:applicationhiit/values/colors.dart';
import 'package:flutter/material.dart';

class MyBottoun extends StatelessWidget {
  
  final String text ;
  final void Function() click;
  const MyBottoun({super.key, required this.text ,required this.click});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: 175,
                height: 35,
                child: ElevatedButton(onPressed:click,style: ButtonStyle(backgroundColor:MaterialStateProperty.all(ConstColors.maincolor),shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color:ConstColors.maincolor)
                  )
                )), child: Text(text,style: const TextStyle (color:Colors.white,fontWeight: FontWeight.bold))
                ),
              )
      

    ;
  }
}