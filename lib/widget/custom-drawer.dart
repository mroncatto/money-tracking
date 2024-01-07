import 'package:flutter/material.dart';

import '../controller/home_controller.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            /*currentAccountPicture: ClipOval(
              child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn0-Z-ZlJ-BBDAJNQSGIssuc0-_ri2mt_kf7rk746k8AkAEzImaoIsHcqVR44E3Mky4Xw&usqp=CAU"),
            ),*/
            accountName: Text("User"), accountEmail: Text("user@example.com"),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text("Terrain"),
            subtitle: Text('Lista de terras'),
          ),
          SwitchListTile(
            title: const Text('Modo Oscuro'),
            value: HomeController.instance.isDarkTheme,
            onChanged: (bool value) {
              setState(() {
                HomeController.instance.changeTheme();
              });
            },
            secondary: HomeController.instance.isDarkTheme
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.dark_mode_outlined),
          )
          /*
          new Container(child: new DrawerHeader(child: new CircleAvatar()),color: Colors.tealAccent,),
          new Container (
            color: Colors.blueAccent,
            child: new Column(
              children: new List.generate(4, (int index){
                return new ListTile(
                  leading: new Icon(Icons.info),
                );
              }),
            ),
          )
           */
        ],
      ),
    );
  }
}
