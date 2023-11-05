import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Map<String, dynamic> admin;
  const Home({super.key, required this.admin});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: unused_field
  int _select = 0;
  bool menu = false;

  @override
  void initState();

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
                      height: 30,
                    ),
                    const Row(
                      children: [
                        Flexible(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.person_2_outlined),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "client",
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontFamily: "Baloo", fontSize: 16),
                                    )
                                  ],
                                ),
                                Text(
                                  "1 client(s)",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontFamily: "Baloo", fontSize: 28),
                                )
                              ],
                            ),
                          ),
                        )),
                        Flexible(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.home_repair_service_outlined,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Service Proposer",
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: "Baloo",
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                                Text(
                                  "3 service(s)",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: "Baloo",
                                      fontSize: 28),
                                )
                              ],
                            ),
                          ),
                        )),
                        Flexible(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.message,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Suggestion",
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          color: Colors.purple,
                                          fontFamily: "Baloo",
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                                Text(
                                  "0 non lus",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontFamily: "Baloo",
                                      fontSize: 28),
                                )
                              ],
                            ),
                          ),
                        )),
                        Flexible(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.attach_money_outlined,
                                      color: Colors.lightGreen,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Revenue",
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          color: Colors.lightGreen,
                                          fontFamily: "Baloo",
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                                Text(
                                  "0 FCFA",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontFamily: "Baloo",
                                      fontSize: 28),
                                )
                              ],
                            ),
                          ),
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            const Text(
                              "demande de services",
                              style:
                                  TextStyle(fontFamily: "Baloo", fontSize: 20),
                            ),
                            Text(
                              "0 service(s) non traiter",
                              style: TextStyle(
                                  fontFamily: "Baloo",
                                  fontSize: 16,
                                  color: Colors.grey.withOpacity(0.8)),
                            )
                          ],
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DataTable(
                            headingRowColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.grey.withOpacity(0.3)),
                            columns: const [
                              DataColumn(label: Text("client")),
                              DataColumn(label: Text("service")),
                              DataColumn(label: Text("date de debut")),
                              DataColumn(label: Text("date de fin")),
                              DataColumn(label: Text("adresse")),
                              DataColumn(label: Text("action")),
                            ],
                            rows: [
                              DataRow(cells: [
                                const DataCell(Text("nom_client")),
                                const DataCell(Text("nom_client")),
                                const DataCell(Text("nom_client")),
                                const DataCell(Text("nom_client")),
                                const DataCell(Text("nom_client")),
                                DataCell(Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.done),
                                      color: Colors.lightGreen,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.close),
                                      color: Colors.red,
                                    )
                                  ],
                                ))
                              ]),
                            ])
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
