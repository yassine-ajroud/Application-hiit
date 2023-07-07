import 'package:applicationhiit/controllers/car_controller.dart';
import 'package:applicationhiit/values/colors.dart';
import 'package:applicationhiit/viows/screen/ajout_voiture.dart';
import 'package:applicationhiit/viows/widgets/botoun.dart';
import 'package:applicationhiit/viows/widgets/cart_item.dart';
import 'package:applicationhiit/viows/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CarContoller>(context);
    return SafeArea(
      child: Scaffold(appBar: AppBar(automaticallyImplyLeading: false,
        elevation: 0, leading: Builder(
          builder: (ctx) {
            return IconButton (onPressed: () => Scaffold.of(ctx).openDrawer(), icon:const Icon(Icons.menu),color: Colors.black,);
          }
        ),backgroundColor: ConstColors.transparence ,),
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Image.asset('assets/logo1.png',height: 40,),
                const SizedBox(height: 20,),
                FutureBuilder(
                  future: Provider.of<CarContoller>(context,listen: false).getOwnedCars(),
                  builder:(ct,snap){
                    if(snap.connectionState == ConnectionState.waiting){
                      return  const SizedBox(
                        child:  CircularProgressIndicator(
                          color: ConstColors.maincolor,
                        ),
                      );
                    }else if(snap.connectionState == ConnectionState.done){
                      if(prov.ownedCars.isEmpty){
                        return const Text("tu n'as pas de voiture",style: TextStyle(color: Colors.grey,fontSize: 20),);
                      }else{
                        return SizedBox(
                           height: MediaQuery.of(context).size.height*0.83,
                          child: ListView.builder(itemCount: prov.ownedCars.length,
                                            itemBuilder: (ctx,i)=> Padding(
                                              padding:const  EdgeInsets.all(8.0),
                                              child: MyCar(carid: prov.ownedCars[i].id, car: prov.ownedCars[i],),
                                            )),
                        );
                      }
                    }else{
                    const Text("une erreur s'est produite",style: TextStyle(color: Colors.grey,fontSize: 20),);
                    MyBottoun(click: ()async{await Provider.of<CarContoller>(context,listen: false).getOwnedCars();},text:"réessayer");
                    }
            
                    return Container();
            
            
            
                  } 
                )
              ],),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          
        ),
        elevation: 10,
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> AjoutVoiture()));
          },backgroundColor: ConstColors.maincolor,child: const Icon(Icons.add)),floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: MyDrawer(),
      ),
    );
  }
}