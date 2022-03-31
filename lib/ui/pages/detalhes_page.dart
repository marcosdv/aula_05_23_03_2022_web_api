import 'package:aula_05_23_03_2022_web_api/models/models.dart';
import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  final Emissora emissora;

  const DetalhesPage(this.emissora, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(emissora.nome),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.network(emissora.logo,
            width: 300,
            height: 300,
          ),
        ],
      ),
    );
  }
}
