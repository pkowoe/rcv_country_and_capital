import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dio = Dio();
  List pays = [];

  dynamic getCountries() async {
    // voir documentation de dio
    final response = await dio.get(
      "https://restcountries.com/v3.1/all?fields=name,capital,currencies",
    );
    setState(() {
      // il est là pour qu'au cliqué on ait la reponse ie les pays
      pays = response.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page d'acceui"), // titre page d'acceuil
        elevation: 18.0,
        actions: [
          IconButton(
            //icon bouton
            onPressed: () {
              getCountries(); // recuperer pays au cliqué
            },
            icon: const Icon(Icons.refresh), // bouton refresh
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: pays.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              pays[index]["name"]["common"],
            ), // recuperer les pays ie nom et common
            subtitle: Text(
              // recuperer capital de chaque pays normalement je devais mettre l'index zero pour que cela commence par le premier pays
              (pays[index]["capital"]?.isNotEmpty ??
                      false) // l'API (le site en quelque sorte pour els debutants) n'est pas regulière donc sinon j'allais ajouter juste [0] a la fin sans commenecer par le ?
                  ? pays[index]["capital"][0] //ici c'esy une condition:  Si la capitale existe et pas vide affiche la
                  : "Pas de capitale", //  condition: Sinon affiche "Pas de capitale" le cas de Bouvet Island et autres
            ),
          );
        },
      ),
    );
  }
}
