// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          buildSettingItem(
            title: 'Account',
            icon: Icons.account_circle,
            onTap: () {
              // Tindakan yang diambil saat mengklik "Account"
              // Navigasi ke halaman pengaturan akun di sini
            },
          ),
          buildSettingItem(
            title: 'Notification',
            icon: Icons.notifications,
            onTap: () {
              // Tindakan yang diambil saat mengklik "Notification"
              // Navigasi ke halaman pengaturan notifikasi di sini
            },
          ),
          buildSettingItem(
            title: 'Language',
            icon: Icons.language,
            onTap: () {
              // Tindakan yang diambil saat mengklik "Language"
              // Navigasi ke halaman pengaturan bahasa di sini
            },
          ),
          buildSettingItem(
            title: 'Help',
            icon: Icons.help,
            onTap: () {
              // Tindakan yang diambil saat mengklik "Help"
              // Navigasi ke halaman bantuan di sini
            },
          ),
          buildSettingItem(
            title: 'Dark Mode',
            icon: Icons.nightlight_round,
            onTap: () {
              // Tindakan yang diambil saat mengklik "Dark Mode"
            },
          ),
        ],
      ),
    );
  }

  Widget buildSettingItem(
      {required String title,
      required IconData icon,
      required Function onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        onTap();
      },
    );
  }
}
