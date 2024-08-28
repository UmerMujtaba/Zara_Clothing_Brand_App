import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zara/user_side/components/textss.dart';
import 'package:zara/user_side/screens/settings_screens.dart';
import '../screens/drawer_screen/product_per_collection_screen.dart';
import '../screens/login_screen.dart';
import 'constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // Function to handle logout
  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then((_) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('email'); // Clear the email from shared preferences
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => LoginScreen(verificationId: '')),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    expansionMenuItem(String title, List<Map<String, Widget>> subItems) {
      return ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            fontFamily: 'TenorSans',
          ),
        ),
        children: subItems.map((subItem) {
          return ListTile(
            title: Text(
              subItem.keys.first,
              style: const TextStyle(fontFamily: 'TenorSans'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => subItem.values.first,
                ),
              );
            },
          );
        }).toList(),
      );
    }

    return ListView(
      children: [
        expansionMenuItem('New', []),
        expansionMenuItem('Apparel', [
          {'All': ProductPerCollectionPage(collectionName: 'All')},
          {'Outer': ProductPerCollectionPage(collectionName: 'Outer')},
          {'Dress': ProductPerCollectionPage(collectionName: 'Dress')},
          {'Tshirts': ProductPerCollectionPage(collectionName: 'Tshirts')},
          {'Skirt': ProductPerCollectionPage(collectionName: 'Skirt')},
          // Add more mappings for other sub-items and screens
        ]),
        // Add more mappings for other sub-items and screens
        expansionMenuItem('Bag', [
          {'Leather': ProductPerCollectionPage(collectionName: 'Leather')},
          {'Fancy': ProductPerCollectionPage(collectionName: 'Fancy')},
        ]),
        expansionMenuItem('Shoes', []),
        expansionMenuItem('Beauty', []),
        expansionMenuItem('Accessories', [
          {'Glasses': ProductPerCollectionPage(collectionName: 'Glasses')},
          {'Hats': ProductPerCollectionPage(collectionName: 'Hat')},
        ]),
        ListTile(
          title: TextWidget(
            size: 16,
            text: settings,
            fontFamily: 'TenorSans',
            color: Colors.black,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreens()),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 40),
          child: ListTile(
            leading: const Icon(Icons.logout, size: 30, color: Colors.black),
            title: const Text(
              'Log Out',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'TenorSans',
              ),
            ),
            onTap: () async {
              await _logout(context);
            },
          ),
        ),
      ],
    );
  }
}

class MyTabbedDrawer extends StatelessWidget {
  const MyTabbedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          bottom: const TabBar(
            labelStyle: TextStyle(fontFamily: 'TenorSans'),
            tabs: [
              Tab(text: 'WOMEN'),
              Tab(text: 'MAN'),
              Tab(text: 'KIDS'),
            ],
          ),
        ),
        body: const TabBarView(
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
