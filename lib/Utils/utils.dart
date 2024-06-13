import 'package:flutter/material.dart';
import 'package:shopping_list_app/Models/Shopping.dart';
import 'package:shopping_list_app/Pages/common_widgets/common_widgets.dart';
import 'package:shopping_list_app/Data/data.dart';

//utils

void deleteShop(int index,List<Shopping> shop,BuildContext context){
  shop.removeAt(index);
  //On affiche le message
  CommonWidgets.showToast(context: context, message: "Course supprimée");
}

void closeDialog(BuildContext context,TextEditingController controller){
  controller.text=""; //initialisation du champs
  Navigator.of(context).pop();
}

//Ajout d'une course
void add(Shopping shopp){
  shoppingList.insert(0,Shopping.withoutChecked(shopp.name));
}





