import 'package:money_tracking/commons/enums/tipo_movimento.dart';
import 'package:money_tracking/model/categoria.dart';
import 'package:money_tracking/model/conta.dart';
import 'package:money_tracking/model/moeda.dart';

class Movimento {
  String id;
  TipoMovimento tipo;
  bool liquidado;
  DateTime data;
  String descricao;
  Categoria categoria;
  Conta conta;
  double valor;
  double valorContavel;
  Moeda moeda;
  String observacao;

  Movimento(this.id, this.tipo, this.liquidado, this.data, this.descricao, this.categoria, this.conta, this.valor, this.valorContavel, this.moeda, this.observacao);
}