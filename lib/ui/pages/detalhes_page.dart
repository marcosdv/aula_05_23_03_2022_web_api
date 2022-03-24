import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  final Map<String, dynamic> dados;

  const DetalhesPage(this.dados, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dados["Emi_Nome"].toString()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.network(dados["Emi_Logo"].toString()
              .replaceAll("~/", "http://controle.mdvsistemas.com.br/"),
            width: 300,
            height: 300,
          ),
        ],
      ),
    );
  }
}
