import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:money_tracking/controller/home_controller.dart';
import 'package:money_tracking/pages/home/home_page.dart';
import 'package:money_tracking/util/messages.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: HomeController.instance,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Messages.app_title,
            theme: ThemeData(
              textTheme: const TextTheme(
                  headline1:
                      TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
                  headline6:
                      TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
                  bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hindi')),
              primarySwatch: Colors.green,
              brightness: HomeController.instance.isDarkTheme
                  ? Brightness.dark
                  : Brightness.light,
            ),
            initialRoute: '/home',
            routes: {
              '/': (context) => const HomePage()
            },
          );
        });
  }
}

/*
void main() => runApp(const MaterialApp(
  home: Home(),
  debugShowCheckedModeBanner: false,
  localizationsDelegates: [
    DefaultCupertinoLocalizations.delegate,
    DefaultMaterialLocalizations.delegate,
    DefaultWidgetsLocalizations.delegate,
  ],
  supportedLocales: [
    Locale('en', 'US'),
    Locale('pt', 'BR'),
    Locale('es', 'PY')
  ],
));*/
