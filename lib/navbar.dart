import 'package:flutter/material.dart';
import 'package:flutter_dev/Page/HomePage.dart';
import 'package:flutter_dev/Page/kalkulator.dart';
import 'package:flutter_dev/Page/konversiUang.dart';
import 'package:flutter_dev/SideBar.dart';

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
        elevation: 0, // Hilangkan bayangan di bawah AppBar
        title: const Text('Your App Title'), // Ganti dengan judul aplikasi Anda
      ),
      backgroundColor: Colors.blueAccent,
      body: _getPage(_currentIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          // Tambahkan aksi yang sesuai di sini
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                _changePage(0);
              },
            ),
            IconButton(
              icon: const Icon(Icons.calculate),
              onPressed: () {
                _changePage(1);
              },
            ),
            const SizedBox(width: 50), // Spacer
            IconButton(
              icon: const Icon(Icons.attach_money),
              onPressed: () {
                _changePage(2);
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_box),
              onPressed: () {
                _changePage(3);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk mengubah halaman
  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
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
