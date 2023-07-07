import 'package:equatable/equatable.dart';

class Car extends Equatable{
final String model,rNumber,description,id;
String image;
  
   Car({required this.model,required this.rNumber,required this.image,required this.description,required this.id});
  
  @override
  List<Object?> get props => [model,rNumber,image,description,id];

  //serialization
  factory Car.fromJSON(Map<String,dynamic>json){
    return Car(model: json['model'],
     rNumber: json['rNumber'],
     image: json['image'],
     description: json['description'],
     id: json['id']);
  }

  Map<String,dynamic> toJSON()=>{
    'model':model,
    'rNumber':rNumber,
    'image':image,
    'description':description,
    'id':id
  };

}