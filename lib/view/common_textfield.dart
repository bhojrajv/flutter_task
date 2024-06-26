import 'package:flutter/material.dart';
import 'package:flutter_tas/Appconst/appcolors.dart';

class TextFieldForms extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final Widget? icons;
 final String?flag;
 final Widget? sufix;
 final bool?toggleEye;
 final String?hint;
  final dynamic onChange;
  const TextFieldForms({this.onChange, this.toggleEye=true,required this.controller,this.flag,this.label,this.icons,this.sufix,this.hint,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label",style: TextStyle(color: AppcColors.textcolor,fontWeight: FontWeight.w500),),
        SizedBox(height: 8,),
        TextFormField( obscureText:flag=="pass"? toggleEye??false:false, controller: controller,decoration: InputDecoration(border: OutlineInputBorder(borderRadius
            : BorderRadius.circular(10.0),borderSide: BorderSide.none),label: Text("$hint"),hintText: '$hint',prefixIcon: icons,enabled: true,
        filled: true,fillColor: AppcColors.txtgrey,isDense: true,suffixIcon:flag=="pass"? sufix:SizedBox(),),
        onChanged:onChange),
      ],
    );
  }
}
