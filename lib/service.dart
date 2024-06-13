import 'package:flutter/cupertino.dart';
import 'package:shopping_list_app/Shopping.dart';
import 'package:shopping_list_app/common_widgets.dart';
import 'package:shopping_list_app/data.dart';


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





