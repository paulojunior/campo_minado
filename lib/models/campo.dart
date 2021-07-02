class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  Campo({required this.linha, required this.coluna});

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  bool get minado {
    return _minado;
  }

  bool get explodido {
    return _explodido;
  }

  bool get aberto {
    return _aberto;
  }

  bool get marcado {
    return _marcado;
  }
}
