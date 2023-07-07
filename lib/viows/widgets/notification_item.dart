import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyNotificationitem extends StatelessWidget {
  const MyNotificationitem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.report_problem),title:Text("Alertes de vol"),subtitle: Text("Temps"),trailing: Text("Date"),
    );
  }
}