import 'package:flutter/material.dart';



import '../../models/car_model.dart';
import '../../values/colors.dart';
import '../widgets/drawer.dart';

class DetailVoiture extends StatefulWidget {
  const DetailVoiture({super.key,required this.car});
  final Car car;

  @override
  State<DetailVoiture> createState() => _DetailVoitureState();
}

class _DetailVoitureState extends State<DetailVoiture> {
  bool show=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      bottomNavigationBar: ConstrainedBox(constraints: BoxConstraints(
        minHeight:MediaQuery.of(context).size.height*0.1,maxHeight:MediaQuery.of(context).size.height*0.16),
        child: Container(child: Column(children: [Center(
              child: FloatingActionButton(shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
              
                    ),
                    elevation: 10,
              onPressed: (){setState(() {
                show=!show;
              });
                
              },backgroundColor: ConstColors.maincolor,child: const Icon(Icons.mic)),
                      ),
                      const SizedBox(height: 10,),
                      
                  
                const Center(child: Text("Choisissez l'action avec l'utilisation de votre voix",style: TextStyle(color: ConstColors.maincolor, fontSize: 13,fontWeight: FontWeight.bold),)),
                const SizedBox(height: 10,),
                Center(child: Visibility(visible: show , child: const Text("l'action Terminer",style: TextStyle(color:Color.fromARGB(255,81, 85, 126), fontSize: 13,fontWeight: FontWeight.bold),))),
              
                      ]
      
        ),),
      ),

           drawer:const MyDrawer(
        
      ),
      appBar: AppBar(automaticallyImplyLeading: false,
        elevation: 0, leading: Builder(
          builder: (ctx) {
            return IconButton (onPressed: () => Scaffold.of(ctx).openDrawer(), icon:const Icon(Icons.menu),color: Colors.black,);
          }
        ),backgroundColor: ConstColors.transparence ,),
        

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children : [
                Center(child: ClipRRect(borderRadius: BorderRadius.circular(30), child: Image.network(widget.car.image,height: MediaQuery.of(context).size.height*0.45,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,))),
                      const SizedBox(height: 20,),
                       Text(widget.car.model,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 8,),
                       Text(widget.car.rNumber,style:const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 8,),
                       Text(widget.car.description,style:const TextStyle(fontSize: 13,fontWeight: FontWeight.normal),textAlign: TextAlign.justify,),
                      
              
                
                      
                
              ]),
            ),
          ),
        ),
      ),
      
    );
  }
}