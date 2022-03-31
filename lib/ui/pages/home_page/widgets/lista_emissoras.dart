import 'package:aula_05_23_03_2022_web_api/models/models.dart';
import 'package:aula_05_23_03_2022_web_api/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class ListaEmissoras extends StatelessWidget {
  final List<Emissora> listaDados;

  const ListaEmissoras(this.listaDados, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.vertical,
      itemCount: listaDados.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Image.network(listaDados[index].logo,
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(width: 8,),
                  Text(
                    listaDados[index].nome,
                    style: const TextStyle(fontSize: 36),
                  ),
                ],
              ),
            ),
          ),
          onTap: () { _abrirDetalhesClique(context, listaDados[index]); },
        );
      },
    );
  }

  void _abrirDetalhesClique(BuildContext context, Emissora emissora) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetalhesPage(emissora)));
  }
}
