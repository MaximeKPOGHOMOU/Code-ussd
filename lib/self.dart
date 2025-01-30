import 'package:code_ussd/config.dart';
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
          style: TextStyle(
              color: Color.fromARGB(255, 7, 19, 41),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Première Card
                Card(
                    margin: const EdgeInsets.only(
                        top: 70), // Laisse de la place pour l'image
                    elevation: 4,
                    color: const Color.fromARGB(255, 7, 19, 41),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                                height: 50), // Espace pour l'image suspendue
                            Text(
                              'Maxime KPOGHOMOU',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' Développeur web',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )),
                // const SizedBox(height: 20),
                const Center(
                  child: Positioned(
                    top: -100, // Positionne l'image suspendue
                    left: 125, // Positionne légèrement à gauche
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/user.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildScrollableCard(
                      title: 'Telephone',
                      icon: Icons.phone,
                      onTap: () {
                        DialogHelper.showAboutDialogTelephone(context);
                      }),
                  _buildScrollableCard(
                      title: 'Email',
                      icon: Icons.mail_outline_outlined,
                      onTap: () {
                        DialogHelper.sendEmail(context);
                      }),
                  _buildScrollableCard(
                      title: 'Site Web', icon: Icons.web, onTap: () {}),
                  _buildScrollableCard(
                      title: 'Facebook',
                      icon: Icons.facebook,
                      onTap: () {
                        DialogHelper.openFacebookUrl(context);
                      }),
                  _buildScrollableCard(
                      title: 'GitHub', icon: Icons.code, onTap: () {}),
                  _buildScrollableCard(
                      title: 'Linkedin',
                      icon: Icons.business_center,
                      onTap: () {}),
                  _buildScrollableCard(
                      title: 'Twitter',
                      icon: Icons.alternate_email,
                      onTap: () {}),
                  _buildScrollableCard(
                      title: 'Instagram',
                      icon: Icons.camera_alt_outlined,
                      onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollableCard(
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        color: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Icon(icon, color: const Color.fromARGB(255, 7, 19, 41)),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 7, 19, 41),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
