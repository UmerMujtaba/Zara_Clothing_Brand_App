import 'package:flutter/material.dart';

import '../screens/cetegory_grid.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    expansionMenuItem(String title, List<String> subItems) {
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
            title: Text(subItem, style: const TextStyle(fontFamily: 'TenorSans'),),
            onTap: () {
             Navigator.push(context,  MaterialPageRoute(
                 builder: (context) => const CetegoryGrid()));
            },
          );
        }).toList(),

      );
    }

    return ListView(
      children: [
        expansionMenuItem( 'New', []),
        expansionMenuItem( 'Appeal', ['All','Outer', 'Dress', 'Blouse', 'T-Shirt', 'Knitwear', 'Skirt', 'Pant', 'Denim',]),
        expansionMenuItem( 'Bag', ['Leather', 'Fancy', 'Elegant',]),
        expansionMenuItem( 'Shoes', ['Heals', 'Comfy','Sandals']),
        expansionMenuItem( 'Beauty', ['Cream', 'Kit']),
        expansionMenuItem( 'Accessories', ['Glasses', 'Hats', 'Scarfs']),
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
