import 'package:aula_05_23_03_2022_web_api/constantes.dart';
import 'package:aula_05_23_03_2022_web_api/helpers/extensions.dart';

class Emissora {
  int codigo;
  String nome;
  String logo;

  Emissora({
    required this.codigo,
    required this.nome,
    required this.logo
  });

  factory Emissora.fromMap(Map<String, dynamic> mapa) {
    return Emissora(
      codigo: mapa["Emi_Codigo"].toString().toInt(),
      nome: mapa["Emi_Nome"] ?? "",
      logo: (mapa["Emi_Logo"] ?? "").replaceAll("~/", linkApiWeb)
    );
  }
}