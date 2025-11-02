import 'package:flutter/material.dart';
import 'package:minesweeper/models/campo.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMarcacao;

  const CampoWidget({
    required this.campo,
    required this.onAbrir,
    required this.onAlternarMarcacao,
    super.key,
  });

  Widget? _getImage() {
    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (campo.aberto && campo.quantidadeMinasVizinhanca > 0) {
      int quantidadeMinas = campo.quantidadeMinasVizinhanca;
      return Image.asset('assets/images/aberto_$quantidadeMinas.jpeg');
    } else if (campo.aberto) {
      return Image.asset('assets/images/aberto_0.jpeg');
    } else if (campo.marcado) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarMarcacao(campo),
      child: _getImage(),
    );
  }
}
