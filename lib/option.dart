import 'package:flutter/material.dart';

class Option extends StatefulWidget {
  const Option({super.key, required String searchQuery});

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  int compteur = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(       
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'A Propos',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right_rounded),
              ]),
          const SizedBox(
            height: 10,
          ),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.directions),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Partager l\'application',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right_rounded),
              ]),
          const SizedBox(
            height: 10,
          ),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.stars_rounded),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Noter l\'application',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right_rounded),
              ]),
          const SizedBox(
            height: 10,
          ),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.question_mark),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Qui suis-je ?',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right_rounded),
              ]),
          const SizedBox(
            height: 410,
          ),
          Expanded(
              flex: 1,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Developper par',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Maxime KPOGHOMOU',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
