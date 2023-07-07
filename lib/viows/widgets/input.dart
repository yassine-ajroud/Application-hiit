import 'package:applicationhiit/values/colors.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String hint;
  final bool ? obs;
  final IconData ? icon;
  final void Function() ? click;
  final String? Function(String?)? validator;
  final TextEditingController? controler;
  final int ? length;
  final TextInputType ? type ;
  const InputText({super.key, required this.hint,this.obs,this.icon,this.click,this.type,this.controler,this.validator,this.length});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 7),
      child: TextFormField(
        maxLength: length,
        validator: validator,
        controller: controler,
    obscureText: obs ?? false,
    keyboardType: type ?? TextInputType.text,
        decoration: InputDecoration(
          hintText:hint,
              suffixIcon: obs != null?InkWell(onTap:click, child: Icon(icon)):null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color:ConstColors.maincolor,)
              )
            ),
      ),
    );
  }
}