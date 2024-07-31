import 'package:flutter/material.dart';
import 'package:zaraclothingbrand/components/button.dart';
import 'package:zaraclothingbrand/screens/homepage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    expansionMenuItem(IconData icon, String title, List<String> subItems) {
      return ExpansionTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            fontFamily: 'TenorSans',
          ),
        ),
        children: subItems.map((subItem) {
          return ListTile(
            title: Text(subItem),
            onTap: () {
              // Handle subitem tap
            },
          );
        }).toList(),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 8),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
          ),
        ),
        expansionMenuItem(Icons.account_circle, 'Account Details', ['Profile', 'Settings']),
        expansionMenuItem(Icons.people, 'Reader List', ['Friends', 'Followers']),
      ],
    );
  }
}

class MyTabbedDrawer extends StatelessWidget {
  const MyTabbedDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
         //leading: Icon(Icons.),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Man'),
              Tab(text: 'Woman'),
              Tab(text: 'Kids'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyDrawer(), // Drawer for 'Man'
            MyDrawer(), // Drawer for 'Woman'
            MyDrawer(), // Drawer for 'Kids'
          ],
        ),
      ),
    );
  }
}
