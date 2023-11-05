import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:service_pay_admin/responsive.dart';
import 'package:service_pay_admin/widget/monbouton.dart';
import 'package:service_pay_admin/const.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Connexion extends StatefulWidget {
  TextEditingController email = TextEditingController();
  TextEditingController mdp = TextEditingController();
  Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  Map<String, dynamic> admin = {};
  bool isChecked = false;

  Future<void> connexion() async {
    var infoAdmin = {
      'email': widget.email.text,
      'mot_de_passe': widget.mdp.text,
    };

    final String apiUrl = Url + '/connexionAdmin'; // Remplacez par votre URL

    final response = await http.post(Uri.parse(apiUrl),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/jspn',
        },
        body: infoAdmin);

    if (response.statusCode == 201) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (mounted) {
        setState(() {
          admin = data['admin'];
        });
      }
    } else {
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (Responsive.isDesktop(context))
            Expanded(
                child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(60.0),
              color: const Color.fromARGB(255, 42, 12, 79),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        image: DecorationImage(
                            image: AssetImage("assets/images/applogo.png"))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Bon retour sur ServicePay Administration",
                    style: TextStyle(
                        fontFamily: "Baloo", fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    "Consulter et gérer les demandes de services des clients. Faire un état de lieu sur les services proposer.",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontFamily: "Baloo",
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.6)),
                  )
                ],
              ),
            )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!Responsive.isDesktop(context))
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 42, 12, 79)),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bienvenue sur ServicePay Administration",
                              style: TextStyle(
                                  fontFamily: "Baloo",
                                  fontSize: 22,
                                  color: Colors.white),
                            ),
                          ]),
                    ),
                  ),
                Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Connexion",
                            style: TextStyle(fontFamily: "Baloo", fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5))),
                            child: TextField(
                              controller: widget.email,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  hintText: "Email...",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "Baloo",
                                      fontSize: 14),
                                  border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5))),
                            child: TextField(
                              controller: widget.mdp,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  hintText: "Mot de passe...",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "Baloo",
                                      fontSize: 14),
                                  border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MonBouton(
                              action: () {
                                if (widget.email.text.isEmpty ||
                                    widget.mdp.text.isEmpty) {
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.warning,
                                    confirmBtnColor:
                                        const Color.fromARGB(255, 42, 12, 79),
                                    title: "Attention",
                                    text:
                                        "Veillez Remplire tous les champs avant de valider votre formulaire !",
                                  );
                                } else if (widget.email.text.isNotEmpty &&
                                    widget.mdp.text.isNotEmpty &&
                                    widget.mdp.text.length == 8) {
                                  connexion();
                                }
                                //Navigator.pushNamed(context, "home");
                              },
                              btntexte: "Se connecter",
                              btncolor: const Color.fromARGB(255, 42, 12, 79),
                              textecolor: Colors.white)
                        ],
                      ),
                    ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
