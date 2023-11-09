// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/Page/HomePage.dart';
import 'package:flutter_dev/SideBar.dart';
import 'package:flutter_dev/Page/kalkulator.dart';
import 'package:flutter_dev/Page/konversiUang.dart';

class CurveBar extends StatefulWidget {
  const CurveBar({Key? key}) : super(key: key);

  @override
  State<CurveBar> createState() => _CurveBarState();
}

class _CurveBarState extends State<CurveBar> {
  int _currentIndex = 0; // Indeks halaman saat ini

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.blueAccent,
      body: _getPage(_currentIndex),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: const [
          Icon(Icons.home),
          Icon(Icons.calculate),
          Icon(Icons.money),
        ],
        onTap: (index) {
          // Ketika item navigasi ditekan, perbarui indeks halaman saat ini
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  // Fungsi untuk mengembalikan halaman sesuai dengan indeks
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomePage(); // Gantilah dengan halaman pertama Anda
      case 1:
        return const Kalkulator(); // Gantilah dengan halaman kedua Anda
      case 2:
        return const KonversiUang(); // Gantilah dengan halaman ketiga Anda
      default:
        return const HomePage();
    }
  }
}
