// ignore_for_file: prefer_const_constructors, avoid_returning_null_for_void, file_names

import 'package:flutter/material.dart';
import 'package:flutter_dev/Page/IOT.dart';
import 'package:flutter_dev/Page/LoginPage.dart';
import 'package:flutter_dev/Page/SettingsPage.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Ali Akbar Permana'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/pp1.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://media.discordapp.net/attachments/1025422736497070165/1037546232727490560/back1.jpg?ex=6555773a&is=6543023a&hm=c5bbf9874141044aae4679310a99f0584c7e779152fa0563e75f83001396b14d&=&width=1068&height=601',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: Icon(Icons.cloud_sync),
            title: Text('Internet of Things'),
            onTap: () {
              // Navigasikan pengguna ke halaman Settings
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Iot(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Course Schedule'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.task),
            title: Text('Task'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '69',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigasikan pengguna ke halaman Settings
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SettingsPage(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.android),
            title: Text('About App'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
