import 'dart:ffi';

class CreditCard {

  String? bandeira;
  String? banco;
  String? numeroFinal;
  double limite;
  String? moeda;

  CreditCard(this.bandeira, this.banco, this.numeroFinal, this.limite, this.moeda);
}