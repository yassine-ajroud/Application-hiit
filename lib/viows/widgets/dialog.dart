import 'package:applicationhiit/values/colors.dart';
import 'package:flutter/material.dart';


class MyDialog extends StatelessWidget {
  const MyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
  title: const Text("termes et conditions"),
  titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color:ConstColors.maincolor,fontSize: 20),
  backgroundColor: Colors.white,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20))
  ),
  content: const Text("En utilisant cette application, vous certifiez que vous avez lu et examiné le présent accord et que vous acceptez de vous conformer à ses conditions. Si vous ne souhaitez pas être lié par les termes de cet accord, il vous est conseillé de cesser d'utiliser l'application en conséquence.Si vous ne voulez pas être lié par les termes de cet accord, nous vous conseillons de cesser d'utiliser l'application en conséquence. H.I.I.T uniquement l'utilisation et l'accès à cette application, à ses produits et à ses services aux personnes qui ont accepté ses conditions."),
);
  }
}