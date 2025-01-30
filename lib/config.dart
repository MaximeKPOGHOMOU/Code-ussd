import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

// ====La methode qui permet d'extraire l'url=========
Future<void> _openURL(
    BuildContext context, Uri uri, String errorMessage) async {
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            errorMessage,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
        ));
      }
    }
  } catch (e) {
    debugPrint('error:  $e');
  }
}

// ====La methode qui permet d'ouvrir le clavier du telephone=========
void makePhoneCall(BuildContext context, String number) async {
  // Encode les caractères spéciaux (* et #)
  final Uri phoneUri = Uri(scheme: 'tel', path: Uri.encodeComponent(number));
  _openURL(context, phoneUri, "Impossible de composser ce numero");
}

// ====La methode qui permet d'ouvrir l'application m essage=========
void _sendMessage(BuildContext context, String phoneNumber) async {
  try {
    final Uri smsUri = Uri(scheme: 'sms', path: phoneNumber);
    _openURL(context, smsUri, "Impossible d'envoyer le message");
  } catch (e) {
    debugPrint('Erreur: : $e');
  }
}

// ====La methode qui permet d'ouvrir l'application whatsApp=========
void _openWhatApp(BuildContext context, String phoneNumber) async {
  String whatApp = 'https://wa.me/$phoneNumber';
  try {
    final Uri whatsAppUri = Uri.parse(whatApp);
    _openURL(context, whatsAppUri, "Impossible d'ouvir whatsApp");
  } catch (e) {
    debugPrint('Erreur : $e');
  }
}

// ====La classe pour les boite de dialogue=========
class DialogHelper {
  static void sendEmail(BuildContext context) async {
    const String email = 'maximekpoghomou18@gmail.com';
    try {
      final Uri mailToUri = Uri(scheme: 'mailto', path: email);
      _openURL(context, mailToUri, "Impossible d'ouvrir l'application mail");
    } catch (e) {
      debugPrint('Erreur : $e');
    }
  }

  // ====La classe pour les boite de dialogue=========
  static void openFacebookUrl(BuildContext context) async {
    const String openFacebookUrl =
        'https://www.facebook.com/profile.php?id=100009412687098';
    try {
      final Uri uri = Uri.parse(openFacebookUrl);
      await _openURL(context, uri, "Impossible d'ouvrir Facebook");
    } catch (e) {
      debugPrint('Erreur : $e');
    }
  }

  static void shared() {
    Share.share(
        'Decouvrez cette application, Telecharger ici: www.facebook.com',
        subject: 'Partager notre application');
  }

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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 70, vertical: 35),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => makePhoneCall(context, '625192418'),
                child: const Text(
                  'Appeler',
                  style: TextStyle(
                      color: Color.fromARGB(255, 7, 19, 41), fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                  width: 300,
                  child: Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 189, 182, 182),
                  )),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => _sendMessage(context, '625192418'),
                child: const Text(
                  'Message',
                  style: TextStyle(
                      color: Color.fromARGB(255, 7, 19, 41), fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                  width: 300,
                  child: Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 189, 182, 182),
                  )),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => _openWhatApp(context, '224661110288'),
                child: const Text(
                  'WhatsApp',
                  style: TextStyle(
                      color: Color.fromARGB(255, 7, 19, 41), fontSize: 18),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
