import 'dart:convert';

import 'package:aula_05_23_03_2022_web_api/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<dynamic>> _getLista() async {
    String link = "http://controle.mdvsistemas.com.br/Novelas/Emissoras/GetEmissora";
    http.Response response = await http.get(Uri.parse(link));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Emissoras"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: _getLista(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      return Text("Erro ao exigir a listagem (${snapshot.error.toString()})");
                    }
                    else {
                      return _criarListagem(context, snapshot);
                    }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _criarListagem(BuildContext context, AsyncSnapshot snapshot) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Image.network(snapshot.data[index]["Emi_Logo"].toString()
                      .replaceAll("~/", "http://controle.mdvsistemas.com.br/"),
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(width: 8,),
                  Text(
                    snapshot.data[index]["Emi_Nome"].toString(),
                    style: const TextStyle(fontSize: 36),
                  ),
                ],
              ),
            ),
          ),
          onTap: () { _abrirDetalhesClique(snapshot.data[index]); },
        );
      },
    );
  }

  void _abrirDetalhesClique(Map<String, dynamic> dados) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetalhesPage(dados)));
  }
}