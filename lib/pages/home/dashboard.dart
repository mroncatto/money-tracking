import 'package:flutter/material.dart';
import 'package:money_tracking/pages/home/widget/accounts_resum.dart';
import 'package:money_tracking/pages/home/widget/credit-card-page-view.dart';
import 'package:money_tracking/pages/home/widget/month_balance.dart';
import 'package:money_tracking/pages/home/widget/mov_page_view.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  final double totalReceita = 9500000;
  final double totalGasto = 6200000;
  final double saldoContas = 12250000;
  int _creditCardCurrentIndex = 0;
  int _movCardCurrentIndex = 0;
  bool existemCartoes = false;

 /* @override
  void initState() {
    super.initState();
    _movCardCurrentIndex = 0;
    _creditCardCurrentIndex = 0;
  }*/

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
          AccountsResum(totalReceita: totalReceita, totalGasto: totalGasto, saldoContas: saldoContas),
          SizedBox(
            height: 150,
            child: MovementsPageView(onChanged: (index) {
              setState(() {
                _movCardCurrentIndex = index;
              });
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          //PageViewDots(currentIndex: _movCardCurrentIndex, itens: 2),
          existemCartoes
          ? SizedBox(
            height: 320,
            child: CreditCardPageView(
              onChanged: (index) {
                setState(() {
                  _creditCardCurrentIndex = index;
                });
              },
            ),
          ) : const SizedBox.shrink(),
          //PageViewDots(currentIndex: _creditCardCurrentIndex, itens: 2),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 300,
            child: MonthBalance(totalReceita: totalReceita, totalGasto: totalGasto),
          )
        ],
    );
  }
}
