import 'package:flutter/material.dart';
import 'package:shopping_list_app/common_widgets.dart';
import 'package:shopping_list_app/data.dart';
import 'package:shopping_list_app/service.dart';
import 'consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Shopping List App',
      theme: ThemeData(
        primaryColor: primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: secondary,
        ),
      ),
      debugShowCheckedModeBanner: false,

      home: const MyHomePage(title: 'Accueil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Icon  radioButtonIcon;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    floatingActionButton: FloatingActionButton.small(
        onPressed: (){},
        shape: const CircleBorder(),
        backgroundColor: primary,
        child: const Icon(
            Icons.add_shopping_cart,
            color: secondary,
        ),
    ),
      backgroundColor: fond,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //Le titre de l'application
              Center(child: CommonWidgets.titre(),),
              //La liste
              const SizedBox(height: 10,),
              Expanded(
                child: shoppingList.isNotEmpty ? ListView.builder(
                  itemBuilder:
                      (BuildContext context,int index){
                       radioButtonIcon=CommonWidgets.checkIcon(shoppingList[index]);
                        return Card(
                            elevation: 3,
                            child: ListTile(
                              contentPadding: EdgeInsets.all(8),
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
                                    radioButtonIcon=CommonWidgets.checkIcon(shoppingList[index]);
                                  }),
                                  child: radioButtonIcon
                              ),
                              trailing: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    deleteShop(index, shoppingList);
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
