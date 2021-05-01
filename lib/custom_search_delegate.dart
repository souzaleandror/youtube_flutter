import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            close(context, query);
          }),
      IconButton(
          icon: Icon(Icons.done),
          onPressed: () {
            close(context, query);
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    print("oi");
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    print("Resultado: pesquisa realizada");
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print("Resultado: digitado " + query);
    List<String> lista = List();
    if (query.isNotEmpty) {
      lista = ["Android", "Android Navagacao", "IOS", "Jogos"]
          .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
          .toList();

      return ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              close(context, lista[index]);
            },
            title: Text(lista[index]),
          );
        },
        itemCount: lista.length,
      );
    } else {
      return Center(
        child: Text("Nenhuma sugestao para essa pesquisa"),
      );
    }
  }
}
