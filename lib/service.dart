import 'package:flutter/cupertino.dart';
import 'package:shopping_list_app/Shopping.dart';
import 'package:shopping_list_app/common_widgets.dart';


void deleteShop(int index,List<Shopping> shop,BuildContext context){
  shop.removeAt(index);
  //On affiche le message
  CommonWidgets.showToast(context: context, message: "Course supprimée");
}





