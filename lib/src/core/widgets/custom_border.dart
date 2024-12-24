
import 'package:flutter/material.dart';

InputBorder border ({required Color color , required double width}){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(width),
    borderSide: BorderSide(color: color),
  );
}