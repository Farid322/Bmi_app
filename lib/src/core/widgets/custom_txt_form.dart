import 'package:bmi_app/src/core/widgets/custom_border.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.namecontroller, required this.hintText, required this.label, required this.validator, this.suffixicon, this.prefixicon, 
  });

  final TextEditingController namecontroller;
  final String hintText;
  final String label;
  final Widget? suffixicon;
  final Widget ? prefixicon;
  final String? Function(String?)? validator ;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: namecontroller,
      decoration: InputDecoration(
          label: Text(label),
          prefix: prefixicon,
          hintText: hintText,
          suffix: suffixicon,
          enabledBorder: border(color: Colors.blue, width: 15),
          focusedBorder: border(color: Colors.green, width: 15)),
    );
  }
}
