import 'package:flutter/material.dart';

class DialogHelper {
  static void showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'A PROPOS',
            style: TextStyle(color: Colors.blue),
          ),
          content: const Text(
            'Cette application a été développée par Maxime KPOGHOMOU. Elle vise à offrir une expérience utilisateur fluide et intuitive pour la gestion des codes USSD des réseaux téléphoniques de la Guinée Conakry tels que Orange, MTN, Cellcom...',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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

  static void showAboutDialogTelephone(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:const EdgeInsets.symmetric(horizontal: 80),
          title: const Text(
            'A PROPOS',
            style: TextStyle(color: Colors.blue),
          ),
          content: const Text(
            'Téléphone',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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
}
