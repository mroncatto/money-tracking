import 'package:flutter/material.dart';
import 'package:money_tracking/commons/enums/tipo_movimento.dart';
import 'package:money_tracking/commons/enums/tipo_movimento_caixa.dart';
import 'package:money_tracking/pages/home/dashboard.dart';
import 'package:money_tracking/pages/movimentos/movimento_page.dart';
import 'package:money_tracking/pages/movimentos/novo_movimento.dart';
import 'package:money_tracking/widget/action-button.dart';
import 'package:money_tracking/widget/expandable_fab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indicePagina = 0;

  void _abrirNovaDespesa() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const NovoMovimento(
                tipoMovimento: TipoMovimento.Saida,
                tipoMovCaixa: TipoMovCaixa.Gastos)));
  }

  void _abrirNovaReceita() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const NovoMovimento(
                tipoMovimento: TipoMovimento.Entrada,
                tipoMovCaixa: TipoMovCaixa.Receitas)));
  }

  void _abrirNovaTransferencia() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const NovoMovimento(
                tipoMovimento: TipoMovimento.Saida,
                tipoMovCaixa: TipoMovCaixa.Transacoes)));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [DashboardPage(), MovimentoPage()];

    return Scaffold(
        //drawer: CustomDrawer(),
        // appBar: AppBar(
        //   iconTheme: const IconThemeData(color: Colors.green),
        //   backgroundColor: Colors.white,
        //   //title: Text(Messages.app_title, style: GoogleFonts.notoSans(color: Colors.white, fontSize: 25)),
        //   actions: [
        //     // IconButton(
        //     //   icon: const Icon(Icons.menu),
        //     //   onPressed: () {},
        //     // )
        //     // IconButton(
        //     //   icon: const Icon(Icons.videocam),
        //     //   onPressed: () {
        //     //     print("Acao videocam");
        //     //   },
        //     // ),
        //     // IconButton(
        //     //   icon: const Icon(Icons.account_circle),
        //     //   onPressed: () {
        //     //     print("Acao acount");
        //     //   },
        //     // )
        //   ],
        // ),
        body: Container(
          child: telas[_indicePagina],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green,
          currentIndex: _indicePagina,
          onTap: (index) {
            setState(() {
              _indicePagina = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                // backgroundColor: Colors.orange,
                label: "Inicio",
                icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                // backgroundColor: Colors.red,
                label: "Movimentos",
                icon: Icon(Icons.insert_chart)),
            /*BottomNavigationBarItem(
            // backgroundColor: Colors.blue,
              label: "Contas",
              icon: Icon(Icons.account_balance_wallet)),
          BottomNavigationBarItem(
            // backgroundColor: Colors.green,
              label: "Ajustes",
              icon: Icon(Icons.settings))*/
          ],
        ),
        floatingActionButton: ExpandableFab(
          distance: 112,
          children: [
            ActionButton(
              onPressed: () => _abrirNovaDespesa(),
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              color: Colors.red,
            ),
            ActionButton(
              onPressed: () => _abrirNovaReceita(),
              icon: const Icon(Icons.keyboard_arrow_up_outlined),
              color: Colors.green,
            ),
            ActionButton(
              onPressed: () => _abrirNovaTransferencia(),
              icon: const Icon(Icons.move_up_outlined),
              color: Colors.blue,
            ),
          ],
        ),
    );
  }
}
