import 'package:aula_05_23_03_2022_web_api/datasources/datasources.dart';
import 'package:aula_05_23_03_2022_web_api/models/models.dart';
import 'package:aula_05_23_03_2022_web_api/ui/components/components.dart';
import 'package:aula_05_23_03_2022_web_api/ui/pages/home_page/widgets/lista_emissoras.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              future: EmissoraRemote().get(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const CirculoEspera();
                  default:
                    if (snapshot.hasError) {
                      return Text("Erro ao exigir a listagem (${snapshot.error.toString()})");
                    }
                    else {
                      return ListaEmissoras(snapshot.data as List<Emissora>);
                    }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}