import 'package:flutter/material.dart';
import 'package:youtube/custom_search_delegate.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/emalta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricoes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indexActual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.videocam,
          //   ),
          //   onPressed: () {
          //     print("acao: video");
          //   },
          // ),
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () async {
              print("acao: search");
              String res = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
              print("resultado digitado " + res);
            },
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.account_circle,
          //   ),
          //   onPressed: () {
          //     print("acao: account_circle");
          //   },
          // ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: telas[_indexActual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        //type: BottomNavigationBarType.shifting,
        currentIndex: _indexActual,
        onTap: (index) {
          print(index);
          setState(() {
            _indexActual = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            label: 'Inicio',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            label: 'Em Alta',
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            label: 'Inscricoes',
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            label: 'Biblioteca',
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
