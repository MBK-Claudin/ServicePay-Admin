import 'package:flutter/material.dart';
import 'package:service_pay_admin/responsive.dart';
import 'package:service_pay_admin/widget/monbouton.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  // ignore: unused_field
  int _select = 0;
  bool menu = false;
  bool modifnom = false;
  bool modifmdp = false;

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
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              const Text(
                                " Votre Profil",
                                style: TextStyle(
                                    fontFamily: "Baloo", fontSize: 18),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/userInterface.png"))),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 400,
                                child: ListTile(
                                  title: const Text(
                                    "Nom & Prenom",
                                    style: TextStyle(
                                        fontFamily: "Baloo", fontSize: 18),
                                  ),
                                  subtitle: const Text(
                                    "nom complet",
                                    style: TextStyle(
                                        fontFamily: "Baloo", fontSize: 14),
                                  ),
                                  trailing: const Icon(Icons.edit),
                                  onTap: () {
                                    setState(() {
                                      modifnom = !modifnom;
                                      //modifmdp = modifnom;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 400,
                                child: ListTile(
                                  title: const Text(
                                    "Mot de passe",
                                    style: TextStyle(
                                        fontFamily: "Baloo", fontSize: 18),
                                  ),
                                  subtitle: const Text(
                                    "**********",
                                    style: TextStyle(
                                        fontFamily: "Baloo", fontSize: 14),
                                  ),
                                  trailing: const Icon(Icons.edit),
                                  onTap: () {
                                    setState(() {
                                      modifmdp = !modifmdp;
                                      //modifnom = modifmdp;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 400,
                                child: const ListTile(
                                  title: Text(
                                    "Nom & Prenom",
                                    style: TextStyle(
                                        fontFamily: "Baloo", fontSize: 18),
                                  ),
                                  subtitle: Text(
                                    "nom complet",
                                    style: TextStyle(
                                        fontFamily: "Baloo", fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                        if (Responsive.isDesktop(context))
                          if (modifmdp || modifnom)
                            Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  if (modifnom) ...[
                                    const ModifNom(),
                                  ],
                                  if (modifmdp) ...[
                                    const ModifPass(),
                                  ]
                                ],
                              ),
                            ))
                      ],
                    ),
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

class ModifPass extends StatelessWidget {
  const ModifPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const Text(
            "Modifier votre mot de passe",
            style: TextStyle(fontFamily: "Baloo", fontSize: 18),
          ),
          Container(
            alignment: Alignment.center,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.withOpacity(0.5))),
            child: const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Email...",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontFamily: "Baloo", fontSize: 14),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.withOpacity(0.5))),
            child: const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Comfirmer nouveau mot de passe...",
                  hintStyle: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey,
                      fontFamily: "Baloo",
                      fontSize: 14),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MonBouton(
              action: () {},
              btntexte: "Enregistrer",
              btncolor: Colors.lightGreen,
              textecolor: Colors.white),
        ],
      ),
    );
  }
}

class ModifNom extends StatelessWidget {
  const ModifNom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const Text(
            "Modifier vos nom & prenom",
            style: TextStyle(fontFamily: "Baloo", fontSize: 18),
          ),
          Container(
            alignment: Alignment.center,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.withOpacity(0.5))),
            child: const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Email...",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontFamily: "Baloo", fontSize: 14),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MonBouton(
              action: () {},
              btntexte: "Enregistrer",
              btncolor: Colors.lightGreen,
              textecolor: Colors.white),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
