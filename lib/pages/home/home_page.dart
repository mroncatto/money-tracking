import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_tracking/pages/home/widget/accounts_resum.dart';
import 'package:money_tracking/pages/home/widget/bottom_bar.dart';
import 'package:money_tracking/pages/home/widget/credit-card-page-view.dart';
import 'package:money_tracking/pages/home/widget/mov_page_view.dart';
import 'package:money_tracking/pages/home/widget/page_view_dots.dart';

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
          PageViewDots(currentIndex: _movCardCurrentIndex),
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
          existemCartoes ? PageViewDots(currentIndex: _creditCardCurrentIndex) : const SizedBox.shrink(),
          // SizedBox(
          //   height: 200,
          //   child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text("Balanco Mensal", style: GoogleFonts.baiJamjuree(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text("Receitas", style: GoogleFonts.baiJamjuree(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black45),),
          //           Text("200.000", style: GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),),
          //         ],
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text("Despesas", style: GoogleFonts.baiJamjuree(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black45),),
          //           Text("100.000", style: GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),),
          //         ],
          //       ),
          //       Container(
          //         color: Colors.black26,
          //         height: 1,
          //         width: MediaQuery.of(context).size.width,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text("Balance", style: GoogleFonts.baiJamjuree(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black45),),
          //           Text("100.000", style: GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),),
          //         ],
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomBar(),
    );
  }
}
