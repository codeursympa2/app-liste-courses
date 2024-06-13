

import 'package:flutter/material.dart';
import 'package:shopping_list_app/Shopping.dart';
import 'package:toast_notification/ToasterType.dart';
import 'package:toast_notification/toast_notification.dart';
import 'consts.dart';
class CommonWidgets{

  TextEditingController nameCtrl = TextEditingController();

  static Text titre(){
    return const Text(
        appName,
        style: TextStyle(
          color:primary,
          fontSize: 24,
          fontWeight: FontWeight.w900
        )

    );
  }

  //Permutter les icones
  static Icon checkIcon(Shopping shop){
    IconData checkIcon=shop.checked == true ?  Icons.check_circle :  Icons.circle_outlined;
    Icon icon=Icon(
      checkIcon,
      color: primary,
      size: 50,
    );
    return icon;
  }

  //Afficher un message
  static void showToast({required BuildContext context,
    required String message,
    Color? couleur=success,
    ToasterType? toasterType=ToasterType.Check
  }){
    ToastMe(
        text: message,
        backgroundColor: couleur,
        duration: 1000, type: toasterType!).showToast(context);
  }




  //Button du formulaire
  static  ElevatedButton elevatedButton(Color color,String title,VoidCallback func){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          fixedSize: const Size.fromWidth(100),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Définir le rayon des bords arrondis
          )
      ),
      onPressed: func,
      child: Text(title,style: const TextStyle(color: secondary),),
    );
  }
}
