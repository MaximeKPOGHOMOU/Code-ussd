import 'package:code_ussd/config.dart';
import 'package:flutter/material.dart';

class Arreba extends StatefulWidget {
  final String searchQuery; // Requête de recherche
  const Arreba({super.key, required this.searchQuery});

  @override
  State<Arreba> createState() => _ArrebaState();
}

class _ArrebaState extends State<Arreba> {
  final List<Map<String, String>> allCodes = [
    {
      'image': 'assets/images/mtn.jpeg',
      'details': 'Connaitre son numero',
      'code': '*223#',
    },
    {
      'image': 'assets/images/mtn.jpeg',
      'details': 'Information sur le solde',
      'code': '*223#',
    },
    {
      'image': 'assets/images/mtn.jpeg',
      'details': 'MTN ComJAIM',
      'code': '*100*1#',
    },
    {
      'image': 'assets/images/mtn.jpeg',
      'details': 'MTN Wakhati',
      'code': '*100*2',
    },
    {
      'image': 'assets/images/mtn.jpeg',
      'details': 'Achat de passe jour',
      'code': '*222*1#',
    },
    {
      'image': 'assets/images/mtn.jpeg',
      'details': 'Achat un forfait internet',
      'code': '*100*3#',
    },
    {
      'image': 'assets/images/mtn.jpeg',
      'details': 'Appels internationaux',
      'code': '*100*4#',
    },
  ];

  List<Map<String, String>> get filteredCodes {
    return allCodes
        .where((code) =>
            code['details']!
                .toLowerCase()
                .contains(widget.searchQuery.toLowerCase()) ||
            code['code']!
                .toLowerCase()
                .contains(widget.searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: filteredCodes.isEmpty
          ? const Center(
              child: Column(
                children: [
                  Icon(Icons.search_off,
                      size: 60, color: Color.fromARGB(255, 226, 167, 5)),
                  Text('Aucun résultat trouvé')
                ],
              ),
            )
          : ListView.builder(
              itemCount: filteredCodes.length,
              itemBuilder: (context, index) {
                final code = filteredCodes[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Card(
                    elevation: 2,
                    color: Colors.white,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(5),
                      leading: Image.asset(code['image']!,
                          width: 60, height: 60, fit: BoxFit.cover),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(code['details']!,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(code['code']!,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 226, 167, 5),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          makePhoneCall(code['code']!);
                        },
                        child: const Text('Lancer',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
