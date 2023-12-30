import 'package:intl/intl.dart';

class Messages {
  static String get income => Intl.message("Receitas", name: "income");
  static String get spent => Intl.message("Gastos", name: "spent");
  static String get balance_available => Intl.message("Saldo Disponível", name: "balance_available");
  static String get pending_movements => Intl.message("Movimentos Pendentes", name: "pending_movements");
  static String get pending_recipes => Intl.message("Receitas Pendentes", name: "pending_recipes");
  static String get pending_pay => Intl.message("Pagos Pendentes", name: "pending_pay");
  static String get app_title => Intl.message("Money Tracking", name: "app_title");
}