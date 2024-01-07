import 'package:money_tracking/commons/enums/cartao_bandeira.dart';

class CartaoCredito {

  String? id;
  CartaoBandeira bandeira;
  String? banco;
  String? numeroFinal;
  double limite;
  String? moeda;

  CartaoCredito(this.bandeira, this.banco, this.numeroFinal, this.limite, this.moeda);
}