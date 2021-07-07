import 'package:campo_minado/exceptions/explosao_exception.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/viewmodels/campoviewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Campo', () {
    test('Abrir Campo COM Explosão', () {
      Campo c = Campo(linha: 0, coluna: 0);
      CampoViewModel viewModel = CampoViewModel(campo: c);
      viewModel.campo.minar();
      expect(() => viewModel.abrirCampo(viewModel.campo),
          throwsA(isA<ExplosaoException>()));
    });

    test('Abrir Campo SEM Explosão', () {
      Campo c = Campo(linha: 0, coluna: 0);
      CampoViewModel viewModel = CampoViewModel(campo: c);
      viewModel.abrir();
      expect(viewModel.aberto, isTrue);
    });

    test('Adicionar NÃO Vizinho', () {
      Campo c1 = Campo(linha: 0, coluna: 0);
      Campo c2 = Campo(linha: 1, coluna: 3);
      CampoViewModel viewModelC1 = CampoViewModel(campo: c1);
      viewModelC1.adicionarVizinho(c2);
      expect(viewModelC1.campo.vizinhos.isEmpty, isTrue);
    });

    test('Adicionar Vizinho', () {
      Campo c1 = Campo(linha: 3, coluna: 3);
      Campo c2 = Campo(linha: 3, coluna: 4);
      Campo c3 = Campo(linha: 2, coluna: 2);
      Campo c4 = Campo(linha: 4, coluna: 4);

      CampoViewModel viewModelC1 = CampoViewModel(campo: c1);

      viewModelC1.adicionarVizinho(c2);
      viewModelC1.adicionarVizinho(c3);
      viewModelC1.adicionarVizinho(c4);

      expect(viewModelC1.campo.vizinhos.length, 3);
    });

    test('Minas na Vizinhança', () {
      Campo c1 = Campo(linha: 3, coluna: 3);

      Campo c2 = Campo(linha: 3, coluna: 4);
      c2.minar();

      Campo c3 = Campo(linha: 2, coluna: 2);

      Campo c4 = Campo(linha: 4, coluna: 4);
      c4.minar();

      CampoViewModel viewModelC1 = CampoViewModel(campo: c1);

      viewModelC1.adicionarVizinho(c2);
      viewModelC1.adicionarVizinho(c3);
      viewModelC1.adicionarVizinho(c4);

      expect(viewModelC1.qtdeMinasNaVizinhanca, 2);
    });
  });
}
