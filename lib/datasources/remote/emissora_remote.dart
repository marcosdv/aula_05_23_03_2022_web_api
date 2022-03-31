import 'package:aula_05_23_03_2022_web_api/constantes.dart';
import 'package:aula_05_23_03_2022_web_api/http/http.dart';
import 'package:aula_05_23_03_2022_web_api/models/models.dart';

class EmissoraRemote {
  final _link = "${linkApiNovela}Emissoras/GetEmissora";
  final _clienteHttp = ClienteHttp();

  Future<List<Emissora>> get() async {
    final listaDados = await _clienteHttp.getJson(link: _link);
    return _popularLista(listaDados);
  }

  List<Emissora> _popularLista(List<dynamic> listaDados) {
    List<Emissora> listaRetorno = [];
    for (var i = 0; i < listaDados.length; i++) {
      listaRetorno.add(Emissora.fromMap(listaDados[i]));
    }
    return listaRetorno;
  }
}