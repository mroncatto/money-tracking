import 'package:flutter/material.dart';
import 'package:money_tracking/pages/home/dashboard.dart';
import 'package:money_tracking/pages/movimentos/movimento_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indicePagina = 0;

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if(_indicePagina == 0) {

            }
          },
          backgroundColor: Colors.green,
          shape: const CircleBorder(),
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}
