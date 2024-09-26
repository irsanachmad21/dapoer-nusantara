import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_manager.dart';
import 'package:dapoer_nusantara/home.dart';
import 'package:dapoer_nusantara/favorite.dart';
import 'package:dapoer_nusantara/form.dart';
import 'package:dapoer_nusantara/daerah/jawa_page.dart';
import 'package:dapoer_nusantara/daerah/sumatera_page.dart';
import 'package:dapoer_nusantara/daerah/kalimantan_page.dart';
import 'package:dapoer_nusantara/daerah/sulawesi_page.dart';
import 'package:dapoer_nusantara/daerah/papua_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoriteManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dapoer Nusantara',
      home: MainPage(),
      routes: {
        '/jawa': (context) => JawaPage(),
        '/sumatera': (context) => SumateraPage(),
        '/kalimantan': (context) => KalimantanPage(),
        '/sulawesi': (context) => SulawesiPage(),
        '/papua': (context) => PapuaPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [Home(), Favorite(), FormPage()];

  int selectedIndex = 0;
  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.restaurant, color: Colors.white),
        title: Text(
          'Dapoer Nusantara',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        titleSpacing: 0,
        backgroundColor: Color(0xFFEE2737),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Form',
          ),
        ],
        currentIndex: selectedIndex,
        fixedColor: Color(0xFF00AA13),
        onTap: _onTap,
      ),
      body: pages.elementAt(selectedIndex),
    );
  }
}
