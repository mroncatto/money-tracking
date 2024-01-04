import 'package:flutter/material.dart';
import 'package:money_tracking/pages/home/widget/accounts_resum.dart';
import 'package:money_tracking/pages/home/widget/bottom_bar.dart';
import 'package:money_tracking/pages/home/widget/credit-card-page-view.dart';
import 'package:money_tracking/pages/home/widget/month_balance.dart';
import 'package:money_tracking/pages/home/widget/mov_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _creditCardCurrentIndex = 0;
  int _movCardCurrentIndex = 0;
  bool existemCartoes = true;

 /* @override
  void initState() {
    super.initState();
    _movCardCurrentIndex = 0;
    _creditCardCurrentIndex = 0;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const CustomDrawer(),
      /*appBar: AppBar(
        title: Text(
          Messages.app_title,
          style: GoogleFonts.montserrat(),
        ),
        centerTitle: true,
      ),*/
      backgroundColor: Colors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(15),
        children: [
          const AccountsResum(),
          SizedBox(
            height: 150,
            child: MovementsPageView(onChanged: (index) {
              setState(() {
                _movCardCurrentIndex = index;
              });
            }),
          ),
          const SizedBox(
            height: 20,
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
          const SizedBox(
            height: 200,
            child: MonthBalance(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomBar(),
    );
  }
}
