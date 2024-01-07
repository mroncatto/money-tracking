enum TipoConta {
  Wallet("Carteira"),
  Poupanca("Poupança"),
  Corrente("Corrente"),
  Outra("Outra");

  final String desc;
  const TipoConta(this.desc);

}