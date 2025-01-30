import 'package:code_ussd/arreba.dart';
import 'package:code_ussd/celcom.dart';
import 'package:code_ussd/option.dart';
import 'package:code_ussd/orange.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Code USSD'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isSearching = false;
  String searchQuery = "";

  List<Widget> pages = [
    const Orange(searchQuery: ""), // Pass searchQuery dynamically
    const Arreba(searchQuery: ""), // Pass searchQuery dynamically
    const Cellcom(searchQuery: ""), // Pass searchQuery dynamically
    const Option(searchQuery: ""), // Pass searchQuery dynamically
  ];

  final reseau = [
    Tab(
      icon: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: const Image(
          image: AssetImage('assets/images/orange.jpeg'),
          height: 40,
          width: 40,
          fit: BoxFit.cover,
        ),
      ),
      text: 'Orange',
    ),
    Tab(
      icon: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: const Image(
          image: AssetImage('assets/images/mtn.jpeg'),
          height: 40,
          width: 40,
          fit: BoxFit.cover,
        ),
      ),
      text: 'MTN',
    ),
    Tab(
      icon: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: const Image(
          image: AssetImage('assets/images/celcom.jpeg'),
          height: 40,
          width: 40,
          fit: BoxFit.cover,
        ),
      ),
      text: 'Cellcom',
    ),
    Tab(
      icon: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: const Icon(
          Icons.person_4_rounded,
          size: 40,
        ),
      ),
      text: 'Options', // Texte associé au Tab
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: reseau.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildFloatingActionButton() {
    if (_tabController.index == 3) {
      return const SizedBox.shrink();
    }

    return FloatingActionButton(
      onPressed: () {
        setState(() {
          isSearching = !isSearching;
          if (!isSearching) {
            searchQuery = "";
          }
        });
      },
      backgroundColor: _tabController.index == 0
          ? Colors.orange[900]
          : _tabController.index == 1
              ? const Color.fromARGB(255, 226, 167, 5)
              : const Color.fromARGB(255, 141, 24, 20),
      child: Icon(isSearching ? Icons.close : Icons.search,
          color: Colors.white, size: 30.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: reseau.length,
      child: Scaffold(
        appBar: AppBar(
          title: isSearching
              ? TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'Rechercher par le titre...',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(137, 22, 21, 21),
                          fontStyle: FontStyle.italic),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 243, 240, 240)
                          .withOpacity(0.9),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 30),
                      alignLabelWithHint: true),
                  textInputAction: TextInputAction.search,
                  autocorrect: false,
                  onChanged: (query) {
                    setState(() {
                      searchQuery = query;
                    });
                  },
                )
              : Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue),
                ),
          centerTitle: true,
          toolbarHeight: 80,
          bottom: isSearching
              ? null
              : TabBar(
                  controller: _tabController,
                  tabs: reseau,
                  indicatorColor: Colors.blue,
                  labelColor: Colors.blue,
                ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: TabBarView(
            controller: _tabController,
            children: [
              Orange(searchQuery: searchQuery), // Pass searchQuery dynamically
              Arreba(searchQuery: searchQuery), // Pass searchQuery dynamically
              Cellcom(searchQuery: searchQuery), // Pass searchQuery dynamically
              Option(searchQuery: searchQuery), // Pass searchQuery dynamically
            ],
          ),
        ),
        floatingActionButton: AnimatedBuilder(
          animation: _tabController,
          builder: (context, child) {
            return _buildFloatingActionButton();
          },
        ),
      ),
    );
  }
}
