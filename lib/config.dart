import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void makePhoneCall(String number) async {
  // Encode les caractères spéciaux (* et #)
  final Uri phoneUri = Uri(scheme: 'tel', path: Uri.encodeComponent(number));

  try {
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Impossible de composer le numéro $number';
    }
  } catch (e) {
    debugPrint('Erreur : $e');
  }
}
