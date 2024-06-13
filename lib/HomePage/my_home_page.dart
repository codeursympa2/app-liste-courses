import 'package:flutter/material.dart';
import 'package:shopping_list_app/Consts/colors.dart';
import 'package:shopping_list_app/Data/data.dart';
import 'package:shopping_list_app/Models/Shopping.dart';
import 'package:shopping_list_app/Pages/common_widgets/common_widgets.dart';
import 'package:shopping_list_app/Utils/utils.dart';
import 'package:toast_notification/ToasterType.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Icon  _radioButtonIcon;

  late TextEditingController _nameCtrl;


  @override
  void initState() {
    super.initState();
    _nameCtrl=TextEditingController();
  }


  @override
  void dispose() {
    super.dispose();
    //Réinitialisation
    _nameCtrl=TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 60),
          child: Transform.scale(
            scale: 1.5,
            child: FloatingActionButton.small(

              onPressed: () {
                //Le formulaire
                showDialog(
                  context: context,
                  barrierDismissible: false, // Empêcher la fermeture en touchant à l'extérieur
                  builder: (BuildContext context) {
                    return   AlertDialog(
                      scrollable: true,
                      backgroundColor: secondary,
                      actions: [
                        CommonWidgets.elevatedButton(danger, 'Annuler',
                                (){
                              //Traitement d'annulation
                              closeDialog(context,_nameCtrl);
                            }),
                        CommonWidgets.elevatedButton(primary, 'Valider',
                                (){
                              if(_nameCtrl.text.isEmpty){
                                CommonWidgets.showToast(context: context, message: "Veillez saisir un nom.",couleur: danger,toasterType: ToasterType.Error);
                              }else{
                                setState(() {
                                  add(Shopping.withoutChecked(_nameCtrl.text));
                                });
                                closeDialog(context,_nameCtrl);
                                CommonWidgets.showToast(context: context, message: "Course ajoutée avec succès");
                              }
                            })
                      ],
                      elevation: 15,
                      title: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_box,color: primary,size: 31,),
                          SizedBox(width: 5,),
                          Expanded(child: Text("AJOUTER UNE COURSE",style: TextStyle(color: primary,fontWeight: FontWeight.bold,fontSize: 19),))
                        ],
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextField(
                            autofocus: true,
                            style: const TextStyle(
                                color: primary
                            ),
                            cursorColor: primary,
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: primary)
                                ),
                                hintText: 'Nom de course',
                                floatingLabelStyle: TextStyle(color: primary),
                                labelStyle: TextStyle(color: primary),
                                prefixIcon: Icon(Icons.shopping_cart,color: primary,),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(color: primary, width: 1),                            )
                            ),
                            controller: _nameCtrl,
                          ),

                        ],
                      ),
                    );
                  },
                );
              },
              elevation: 12,
              shape:   const CircleBorder(),
              backgroundColor: primary,
              child: const Icon(
                Icons.add_shopping_cart,
                color: secondary,
              ),
            ),
          ),
        ),
        backgroundColor: fond,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              children: [
                //Le titre de l'application
                CommonWidgets.titre(),
                //La liste
                const SizedBox(height: 10,),
                Expanded(
                  child: shoppingList.isNotEmpty ? ListView.builder(
                    itemBuilder:
                        (BuildContext context,int index){
                      _radioButtonIcon=CommonWidgets.checkIcon(shoppingList[index]);
                      return Card(
                        elevation: 3,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          onTap: (){ },
                          title:  Text(
                            shoppingList[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          ),
                          leading: GestureDetector(
                              onTap: ()=> setState(() {
                                //Mise à jour de la valeur
                                shoppingList[index].checked=!shoppingList[index].checked;
                                //Changement de l'icone
                                _radioButtonIcon=CommonWidgets.checkIcon(shoppingList[index]);
                                //Affichage de la notification
                                shoppingList[index].checked ?
                                CommonWidgets.showToast(context: context, message: "Course validée"):
                                CommonWidgets.showToast(context: context, message: "Course annulée",couleur: danger);

                              }),
                              child: _radioButtonIcon
                          ),
                          trailing: GestureDetector(
                            onTap: (){
                              setState(() {
                                deleteShop(index, shoppingList,context);
                              });
                            },
                            child: const Icon(
                              Icons.delete_forever,
                              size: 36,
                              color: danger,
                            ),
                          ),
                        ),
                      );}
                    ,
                    itemCount: shoppingList.length,

                  ) : const Center(child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.remove_shopping_cart_rounded,color: danger,),
                      SizedBox(width: 5,),
                      Text(
                        "Oups ! Pas de course à faire",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                )
              ],
            ),
          ),

        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}