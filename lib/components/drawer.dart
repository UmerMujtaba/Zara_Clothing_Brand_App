import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaraclothingbrand/screens/drawer_screens/bag_screens/bag_fancy_screen.dart';
import '../screens/drawer_screens/accessories_screens/acc_glasses_screen.dart';
import '../screens/drawer_screens/accessories_screens/acc_hats_screen.dart';
import '../screens/drawer_screens/apparel_screens/apparel_all_grid.dart';
import '../screens/drawer_screens/apparel_screens/apparel_dress_grid.dart';
import '../screens/drawer_screens/apparel_screens/apparel_outer_grid.dart';
import '../screens/drawer_screens/apparel_screens/apparel_skirt_grid.dart';
import '../screens/drawer_screens/apparel_screens/apparel_tshirt_grid.dart';
import '../screens/drawer_screens/bag_screens/bag_leather_screen.dart';
import '../screens/login_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

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
        expansionMenuItem( 'New', []),
        expansionMenuItem('Apparel', [
          {'All': const ApparelAllGridPage()},
          {'Outer': const ApparelOuterGridPage()},
          {'Dress': const ApparelDressPage()},
          {'T-Shirt': const ApparelTshirtGridPage()},
          {'Skirt': const ApparelSkirtGridPage()},
          // Add more mappings for other sub-items and screens
        ]),
  // Add more mappings for other sub-items and screens]),
        expansionMenuItem( 'Bag', [
          {'Leather': const BagLeatherGridPage()},
          {'Fancy': const BagFancyGridPage()},
        ]),
        expansionMenuItem( 'Shoes', []),
        expansionMenuItem( 'Beauty', []),
        expansionMenuItem( 'Accessories', [
          {'Glasses': const AccGlassesGridPage()},
          {'Hats': const AccHatsGridPage()}
        ]),

        ListTile(
          leading: const Icon(Icons.logout,
              size: 30, color: Colors.blueAccent),
          title: const Text(
            'Log Out',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          onTap: () async {
            final SharedPreferences sharedpreferences =
            await SharedPreferences.getInstance();
            sharedpreferences.remove('email');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(
                  verificationId: '',

                ),
              ),
            );
          },
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
        appBar: AppBar(
         leading: IconButton(onPressed: (){
           Navigator.pop(context);
         }, icon: const Icon(Icons.cancel_outlined)),
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
