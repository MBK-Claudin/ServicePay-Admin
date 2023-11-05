import 'package:flutter/material.dart';

class Suggestion extends StatefulWidget {
  const Suggestion({super.key});

  @override
  State<Suggestion> createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  // ignore: unused_field
  int _select = 0;
  bool menu = false;

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
                    const Row(
                      children: [
                        Column(
                          children: [],
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Suggestions des clients",
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontFamily: "Baloo", fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Text(
                            "Nom client",
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontFamily: "Baloo", fontSize: 18),
                          ),
                          subtitle: Text(
                            "contenu du message",
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontFamily: "Baloo", fontSize: 16),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        )
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
