import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/models/tabuleiro.dart';

void main() {
  group('Tabuleiro', () {
    test('Ganhar jogo', () {
      Tabuleiro tabuleiro = Tabuleiro(
        linhas: 2,
        colunas: 2,
        quantidadeBombas: 0,
      );

      tabuleiro.campos[0].minar();
      tabuleiro.campos[2].minar();

      tabuleiro.campos[0].alternarMarcacao();
      tabuleiro.campos[1].abrir();
      tabuleiro.campos[2].alternarMarcacao();
      tabuleiro.campos[3].abrir();

      expect(tabuleiro.resolvido, isTrue);
    });
  });
}
