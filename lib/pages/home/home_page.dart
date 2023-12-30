import 'package:flutter/material.dart';
import 'package:money_tracking/pages/home/widget/accounts_resum.dart';
import 'package:money_tracking/pages/home/widget/page_view.dart';
import 'package:money_tracking/pages/home/widget/page_view_dots.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;

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
          AccountsResum(),
          SizedBox(
            height: 150,
            child: CustomPageView(onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            }),
          ),
          PageViewDots(currentIndex: _currentIndex)
        ],
      )
      /*SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsetsDirectional.only(top: 0),
                  child: Text(Messages.balance_available,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(fontSize: 14))),
              Padding(
                  padding: const EdgeInsetsDirectional.only(top: 5),
                  child: Text(
                    FormatHelper.formatarMoeda(valor: 35000000),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.robotoMono(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // max 19 digitos
                    FlowCard(
                        titulo: Messages.income,
                        receita: true,
                        valor: 10000000),
                    FlowCard(
                        titulo: Messages.spent,
                        receita: false,
                        valor: 10000000),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Messages.pending_movements,
                        style: GoogleFonts.baiJamjuree(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            PendingMovement(),
                            PendingMovement(),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),*/
    );
  }
}
