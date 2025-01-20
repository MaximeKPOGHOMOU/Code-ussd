import 'package:code_ussd/config.dart';
import 'package:flutter/material.dart';

class Orange extends StatefulWidget {
  final String searchQuery; // Requête de recherche
  const Orange({super.key, required this.searchQuery});

  @override
  State<Orange> createState() => _OrangeState();
}

class _OrangeState extends State<Orange> {
  final List<Map<String, String>> allCodes = [
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Acheter un forfait internet',
      'code': '*222#',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Connaître son numéro',
      'code': '*145#',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Information sur le solde',
      'code': '*124#',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Centre d\'appel Distributeur',
      'code': '8272',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Achat de passe jour',
      'code': '*222*1#',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Achat de passe semaine',
      'code': '*222*2#',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Achater passe mois',
      'code': '**222*3#',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Consulter le solde',
      'code': '*225*5#',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Consulter sa liste de numéro ',
      'code': '*707#',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Information sur dernier appel',
      'code': '*223#',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Choco malin',
      'code': '*555#',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Supprimer un numero de sa liste FAF',
      'code': '*125*0*Num#',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Centre d\'appel grand public',
      'code': '8277',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Acheter un pack sms',
      'code': '888',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Acheter passe 200Mo',
      'code': '*222*1#',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Acheter passe TV',
      'code': '*222*4#',
    },
    {
      'image': 'assets/images/orange.jpeg',
      'details': 'Consulter le solde',
      'code': '*222*5#',
    },
  ];

  List<Map<String, String>> get filteredCodes {
    return allCodes
        .where((code) => code['details']!.toLowerCase().contains(widget.searchQuery.toLowerCase())||code['code']!.toLowerCase().contains(widget.searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: filteredCodes.length,
        itemBuilder: (context, index) {
          final code = filteredCodes[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Card(
              elevation: 2,
              color: Colors.white,
              child: ListTile(
                contentPadding: const EdgeInsets.all(5),
                leading: Image.asset(code['image']!, width: 60, height: 60, fit: BoxFit.cover),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(code['details']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(code['code']!, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    makePhoneCall(code['code']!);
                  },
                  child: const Text('Lancer', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
