import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_tracking/controller/home_controller.dart';
import 'package:money_tracking/home.dart';
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
              /*colorScheme: ColorScheme(
                  brightness: HomeController.instance.isDarkTheme
                      ? Brightness.dark
                      : Brightness.light,
                  primary: Colors.green,
                  onPrimary: Colors.greenAccent,
                  secondary: Colors.blue,
                  onSecondary: Colors.blueAccent,
                  error: Colors.red,
                  onError: Colors.redAccent,
                  background: Colors.white,
                  onBackground: Colors.white,
                  surface: Colors.white,
                  onSurface: Colors.grey.shade800
              ),*/
              textTheme: const TextTheme(
                  displayLarge:
                  TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
                  titleLarge:
                  TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
                  bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hindi')
              ),
              brightness: HomeController.instance.isDarkTheme
                   ? Brightness.dark
                   : Brightness.light,
            ),
            home: const Home(),
            localizationsDelegates: const [
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate
            ],
            /*supportedLocales: const [
              Locale('en_US', ''),
              Locale('es_PY', ''),
              Locale('pt_BR', ''),
            ],*/
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
