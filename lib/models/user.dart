import 'package:equatable/equatable.dart';

class FireUser extends Equatable{
  final String username,id,email,phone;
  final List<dynamic> cars;

  const FireUser({required this.username,required this.id,required this.email,required this.phone,required this.cars});
  
  @override
  List<Object?> get props => [username,id,email,phone,cars];

  factory FireUser.fromJSON(Map<String,dynamic>json){
    return FireUser(username: json['userName'],
     id: json['id'],
     phone: json['phone'],
     email: json['email'],
     cars: json['cars']??[]);
  }
}