
import 'package:flutter/material.dart';
import 'package:shopping_list_app/Shopping.dart';
import 'consts.dart';
class CommonWidgets{
  static Widget titre(){
    return const Text(
        appName,
        textAlign: TextAlign.center,
        style: TextStyle(
          color:primary,
          fontSize: 22,
          fontWeight: FontWeight.w900
        )

    );
  }


  static Icon checkIcon(Shopping shop){
    IconData checkIcon=shop.checked == true ?  Icons.check_circle :  Icons.circle_outlined;
    Icon icon=Icon(
      checkIcon,
      color: primary,
      size: 50,
    );
    return icon;
  }
}