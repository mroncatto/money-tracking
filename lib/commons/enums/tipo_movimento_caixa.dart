enum TipoMovCaixa {
  Gastos("Gastos"),
  Receitas("Receitas"),
  Transacoes("Transações");

  final String desc;
  const TipoMovCaixa(this.desc);

  static List<TipoMovCaixa> obterTipos() {
    return TipoMovCaixa.values.toList();
  }

  isGastos() {
    return TipoMovCaixa.Gastos.desc == desc;
  }

  isReceitas() {
    return TipoMovCaixa.Receitas.desc == desc;
  }

}