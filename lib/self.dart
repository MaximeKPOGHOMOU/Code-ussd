import 'package:flutter/material.dart';

class MySelf extends StatefulWidget {
  const MySelf({super.key});

  @override
  State<MySelf> createState() => _MySelfState();
}

class _MySelfState extends State<MySelf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mon Profil',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Card
                  Card(
                    margin: const EdgeInsets.only(
                        top: 40), // Laisse de la place pour l'image
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50), // Espace pour l'image suspendue
                          Text(
                            'Nom : Maxime KPOGHOMOU',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.email, color: Colors.blue),
                              SizedBox(width: 10),
                              Text(
                                'Email : maxime.k@gmail.com',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.phone, color: Colors.green),
                              SizedBox(width: 10),
                              Text(
                                'Téléphone : +224 625 19 24 18',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.red),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Adresse : Mamou, Conakry, Guinée',
                                  style: TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // CircleAvatar
                  const Positioned(
                    top: -25, // Positionne l'image suspendue
                    left: 125, // Positionne légèrement à gauche
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/user.jpg'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
