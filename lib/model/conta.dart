import 'package:money_tracking/commons/enums/tipo_conta.dart';

import 'moeda.dart';

class Conta {

  String? id;
  String descricao;
  double saldoInicial;
  TipoConta tipo;
  String cor;
  bool incluiNoCalculo;
  Moeda moeda;

  Conta(this.id, this.descricao, this.saldoInicial, this.tipo, this.cor, this.incluiNoCalculo, this.moeda);
}