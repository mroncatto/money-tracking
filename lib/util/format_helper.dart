import 'package:intl/intl.dart';

class FormatHelper {

  static String formatarMoeda({required valor, symbol="", decimalDigits=0}) {
    NumberFormat formatoMoeda = NumberFormat.currency(locale: 'es_PY', symbol: symbol, decimalDigits: 0);
    return formatoMoeda.format(valor);
  }

  static String getMonthName({required monthNumber}) {
    List<String> months = <String>["Janeiro", "Fevereiro", "Marco", "Abril", "Maio", "Junio", "Julio", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];
    if(monthNumber < 0 || monthNumber > 12) return "";
    return months[--monthNumber];
  }

}