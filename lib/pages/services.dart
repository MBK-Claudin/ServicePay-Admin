import 'package:flutter/material.dart';
import 'package:service_pay_admin/widget/monbouton.dart';
//import 'dart:convert';
import 'package:http/http.dart' as http;

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  String responseData = "";

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('http://your-backend-api-endpoint'),
    );

    if (response.statusCode == 200) {
      setState(() {
        responseData = response.body;
        //final service = jsonDecode(response.body);
      });
    } else {
      // Gérer les erreurs, par exemple, afficher un message d'erreur
      setState(() {
        responseData = 'Erreur: ${response.statusCode}';
      });
    }
  }

  // ignore: unused_field
  int _select = 0;
  bool menu = false;
  bool modif = false;
  bool ajout = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: const Color.fromARGB(255, 42, 12, 79),
            extended: menu,
            selectedIndex: 0,
            unselectedIconTheme:
                IconThemeData(color: Colors.white.withOpacity(0.7)),
            unselectedLabelTextStyle:
                TextStyle(color: Colors.white.withOpacity(0.7)),
            selectedIconTheme: const IconThemeData(color: Colors.white),
            selectedLabelTextStyle: const TextStyle(color: Colors.white),
            onDestinationSelected: (int index) {
              setState(() {
                _select = index;
              });
              switch (index) {
                case 0:
                  Navigator.of(context).pushNamed('home');
                  break;
                case 1:
                  Navigator.of(context).pushNamed('profil');
                  break;
                case 2:
                  Navigator.of(context).pushNamed('service');
                  break;
                case 3:
                  Navigator.of(context).pushNamed('suggestion');
                  break;
                case 4:
                  Navigator.of(context).pushNamed('/');
                  break;
              }
            },
            labelType: NavigationRailLabelType.none,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Accueil'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text('Profil'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.home_repair_service_outlined),
                label: Text('Services'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.message),
                label: Text('Suggestion'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.logout),
                label: Text('déconnexion'),
              ),
            ],
          ),
          const VerticalDivider(),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                // colone principale
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                menu = !menu;
                              });
                            },
                            icon: const Icon(Icons.menu)),
                        const Spacer(),
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          backgroundImage: const AssetImage(
                              "assets/images/userInterface.png"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "admin@gmail.com",
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontFamily: "Baloo", fontSize: 16),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Services",
                              overflow: TextOverflow.clip,
                              style:
                                  TextStyle(fontFamily: "Baloo", fontSize: 20),
                            ),
                            MonBouton(
                                action: () {
                                  setState(() {
                                    ajout = !ajout;
                                  });
                                },
                                btntexte: "Ajouter un service",
                                btncolor: const Color.fromARGB(255, 42, 12, 79),
                                textecolor: Colors.white)
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: DataTable(
                              headingRowColor:
                                  MaterialStateProperty.resolveWith(
                                      (states) => Colors.grey.withOpacity(0.3)),
                              columns: const [
                                DataColumn(
                                    label: Text(
                                  "Titre",
                                  style: TextStyle(
                                      fontFamily: "Baloo", fontSize: 16),
                                )),
                                DataColumn(
                                    label: Text(
                                  "Description",
                                  style: TextStyle(
                                      fontFamily: "Baloo", fontSize: 16),
                                )),
                                DataColumn(
                                    label: Text(
                                  "Tarifs",
                                  style: TextStyle(
                                      fontFamily: "Baloo", fontSize: 16),
                                )),
                                DataColumn(
                                    label: Text(
                                  "Horaires",
                                  style: TextStyle(
                                      fontFamily: "Baloo", fontSize: 16),
                                )),
                                DataColumn(
                                    label: Text(
                                  "action",
                                  style: TextStyle(
                                      fontFamily: "Baloo", fontSize: 16),
                                )),
                              ],
                              rows: [
                                DataRow(cells: [
                                  const DataCell(Text(
                                    "nom_client",
                                    style: TextStyle(
                                        fontFamily: "Baloo", fontSize: 16),
                                  )),
                                  const DataCell(Text(
                                    "nom_client",
                                    style: TextStyle(
                                        fontFamily: "Baloo", fontSize: 16),
                                  )),
                                  const DataCell(Text(
                                    "nom_client",
                                    style: TextStyle(
                                        fontFamily: "Baloo", fontSize: 16),
                                  )),
                                  const DataCell(Text(
                                    "nom_client",
                                    style: TextStyle(
                                        fontFamily: "Baloo", fontSize: 16),
                                  )),
                                  DataCell(Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              modif = !modif;
                                            });
                                          },
                                          child: const Text(
                                            "modifier",
                                            style: TextStyle(
                                                color: Colors.lightGreen,
                                                fontFamily: "Baloo",
                                                fontSize: 16),
                                          )),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "supprimer",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: "Baloo",
                                                fontSize: 16),
                                          )),
                                    ],
                                  ))
                                ]),
                              ]),
                        ),
                        if (modif)
                          const BottomBlock(
                            titre: "Modifier le service",
                          ),
                        if (ajout)
                          const BottomBlock(titre: "Ajouter un service")
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomBlock extends StatelessWidget {
  final String titre;
  final String? intitule;
  final String? description;
  final String? tarifs;
  final String? horaire;

  const BottomBlock({
    super.key,
    required this.titre,
    this.intitule,
    this.description,
    this.tarifs,
    this.horaire,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 42, 12, 79),
            ),
            child: Text(
              titre,
              style: const TextStyle(
                  fontFamily: "Baloo", fontSize: 20, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.withOpacity(0.5))),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: intitule,
                  labelStyle: const TextStyle(
                      color: Colors.grey, fontFamily: "Baloo", fontSize: 14),
                  hintText: "Intitulé du services...",
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontFamily: "Baloo", fontSize: 14),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.withOpacity(0.5))),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: description,
                  labelStyle: const TextStyle(
                      color: Colors.grey, fontFamily: "Baloo", fontSize: 14),
                  hintText: "description...",
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontFamily: "Baloo", fontSize: 14),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.withOpacity(0.5))),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: tarifs,
                  labelStyle: const TextStyle(
                      color: Colors.grey, fontFamily: "Baloo", fontSize: 14),
                  hintText: "Tarifs...",
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontFamily: "Baloo", fontSize: 14),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.withOpacity(0.5))),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: description,
                  labelStyle: const TextStyle(
                      color: Colors.grey, fontFamily: "Baloo", fontSize: 14),
                  hintText: "Email...",
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontFamily: "Baloo", fontSize: 14),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MonBouton(
              action: () {},
              btntexte: "Enregistrer",
              btncolor: Colors.lightGreen,
              textecolor: Colors.white)
        ],
      ),
    );
  }
}
