import 'package:flutter/material.dart';
import 'package:service_pay_admin/pages/connexion.dart';
//import 'package:service_pay_admin/pages/home.dart';
import 'package:service_pay_admin/pages/profil.dart';
import 'package:service_pay_admin/pages/services.dart';
import 'package:service_pay_admin/pages/suggestion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: "/",
      routes: {
        "/": (context) => Connexion(),
        //"home": (context) => const Home(),
        "profil": (context) => const Profil(),
        "service": (context) => const Services(),
        "suggestion":(context) => const Suggestion(), 
      },
    );
  }
}
