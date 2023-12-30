import 'package:intl/intl.dart';

class FormatHelper {

  static String formatarMoeda({required valor}) {
    NumberFormat formatoMoeda = NumberFormat.currency(locale: 'es_PY', symbol: 'G\$', decimalDigits: 0);
    return formatoMoeda.format(valor);
  }

}