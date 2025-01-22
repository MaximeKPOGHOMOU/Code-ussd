import 'package:code_ussd/self.dart';
import 'package:flutter/material.dart';

class Option extends StatefulWidget {
  const Option({super.key, required String searchQuery});

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     FocusScope.of(context).unfocus();
  //   });
  // }
  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'A PROPOS',
            style: TextStyle(color: Colors.blue),
          ),
          content: const Text(
            'Cette application a été développée par Maxime KPOGHOMOU. Elle vise à offrir une expérience utilisateur fluide et intuitive pour la gestion des code ussd des réseaux téléphonique da la guinée conakry telque Orange, MTN, Cellcom ...',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
              child: const Text(
                'Fermer',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap:
                    _showAboutDialog, // Appelle la fonction pour afficher la boîte de dialogue
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical:
                          16.0), // Ajoute du padding pour agrandir la zone cliquable
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info_outline),
                          SizedBox(width: 20),
                          Text(
                            'À Propos',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Logique pour "Partager l'application"
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.directions),
                          SizedBox(width: 20),
                          Text(
                            'Partager l\'application',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Logique pour "Noter l'application"
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.stars_rounded),
                          SizedBox(width: 20),
                          Text(
                            'Noter l\'application',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>const MySelf()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.question_mark),
                          SizedBox(width: 20),
                          Text(
                            'Qui suis-je ?',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Developper par',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Maxime KPOGHOMOU',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
