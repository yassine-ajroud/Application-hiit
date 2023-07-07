import 'package:applicationhiit/viows/screen/detailles_voiture.dart';
import 'package:applicationhiit/viows/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/car_controller.dart';
import '../../models/car_model.dart';
import '../../values/colors.dart';


class MyCar extends StatelessWidget {
 const MyCar({super.key ,required this.carid,required this.car});
final Car car;
 final String carid;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const ValueKey("key"),confirmDismiss: (direction) async{
      await showDialog(context: context, builder: (_){return AlertDialog(
        title: const Text("êtes-vous sûr de vouloir supprimer cette voiture?"),
  titleTextStyle:const TextStyle(fontWeight: FontWeight.bold,color:ConstColors.maincolor,fontSize: 20),
  backgroundColor: Colors.white,
  shape:const  RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20))
  ),
  actionsPadding:const EdgeInsets.symmetric(horizontal:20,vertical: 10),
        actions: <Widget>[
          ElevatedButton(
     style: ElevatedButton.styleFrom(
                primary: Colors.grey,
         ),
 onPressed: () async{
              await  Provider.of<CarContoller>(context,listen: false).deleteCar(carid).then((value) => {
                Navigator.of(context).pop()
              }).then((value) async {
                await Provider.of<CarContoller>(context,listen: false).getOwnedCars();
              });
            },
            child: const Text("Supprimer")
          ),
          ElevatedButton(
        style: ElevatedButton.styleFrom(
                primary: ConstColors.maincolor,
         ),                     onPressed: () => Navigator.of(context).pop(false),

           
            child: const Text("Annuler"),
          ),
        ],
      );});
    },

      child: Container(
        decoration: BoxDecoration(color: Colors.white,
          
          boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0,0), // qui change la position de shadow
        ),
      ],
      borderRadius: const BorderRadius.all(
          Radius.circular(15) //                 // border radius
      ),
        ),
        child: ListTile(onTap: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  DetailVoiture(car: car,)));
        }, leading: ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.network(car.image,width: 80,fit: BoxFit.cover,)),title: Text(car.model) ,subtitle: Text(car.rNumber),),
        
      ),
    );
  }
}