import 'package:flutter/material.dart';

var myDefaultBackground  = Colors.grey.shade300;

var myAppBar = AppBar(
  backgroundColor: Colors.grey.shade900,
);

var myDrawer= Drawer(
  backgroundColor: Colors.grey.shade500,
  child: SingleChildScrollView(
    child: Column(
      children: [
        const DrawerHeader(child: Image(image: AssetImage('lib/images/logo.png'))),
        ExpansionTile(
          leading: const Icon(Icons.add_box_outlined),
          title: const Text(
            'A D D',
            style: TextStyle(fontFamily: 'TenorSans'),
          ),
          children: [
            ExpansionTile(

              title: const Text(
                'B A G',
                style: TextStyle(fontFamily: 'TenorSans'),
              ),
              children: [
                ListTile(
                  title: const Text(
                    'L E A T H E R',
                    style: TextStyle(fontFamily: 'TenorSans'),
                  ),
                  onTap: () {
                    // Handle tap on 'Leather'
                  },
                ),
                ListTile(
                  title: const Text(
                    'F A N C Y',
                    style: TextStyle(fontFamily: 'TenorSans'),
                  ),
                  onTap: () {
                    // Handle tap on 'Fancy'
                  },
                ),
              ],
            ),
            ExpansionTile(

              title: const Text(
                'A C C E S S O R I E S',
                style: TextStyle(fontFamily: 'TenorSans'),
              ),
              children: [
                ListTile(
                  title: const Text(
                    'G L A S S E S',
                    style: TextStyle(fontFamily: 'TenorSans'),
                  ),
                  onTap: () {
                    // Handle tap on 'Glasses'
                  },
                ),
                ListTile(
                  title: const Text(
                    'H A T',
                    style: TextStyle(fontFamily: 'TenorSans'),
                  ),
                  onTap: () {
                    // Handle tap on 'Hat'
                  },
                ),
              ],
            ),



            ExpansionTile(

              title: const Text(
                'A P P A R E L',
                style: TextStyle(fontFamily: 'TenorSans'),
              ),
              children: [
                ListTile(
                  title: const Text(
                    'O U T E R',
                    style: TextStyle(fontFamily: 'TenorSans'),
                  ),
                  onTap: () {
                    // Handle tap on 'Glasses'
                  },
                ),
                ListTile(
                  title: const Text(
                    'T S H I R T S',
                    style: TextStyle(fontFamily: 'TenorSans'),
                  ),
                  onTap: () {
                    // Handle tap on 'Hat'
                  },
                ),
                ListTile(
                  title: const Text(
                    'D R E S S',
                    style: TextStyle(fontFamily: 'TenorSans'),
                  ),
                  onTap: () {
                    // Handle tap on 'Hat'
                  },
                ),
              ],
            ),


            ListTile(
              title: const Text(
                '',
                style: TextStyle(fontFamily: 'TenorSans'),
              ),
              onTap: () {
                // Handle tap on 'Apparel'
              },
            ),
          ],
        ),
        const ListTile(
          leading: Icon(Icons.view_in_ar),
          title: Text(
            'V I E W',
            style: TextStyle(fontFamily: 'TenorSans'),
          ),
        ),
        const ListTile(
          leading: Icon(Icons.update),
          title: Text(
            'U P D A T E',
            style: TextStyle(fontFamily: 'TenorSans'),
          ),
        ),
        const ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            'S E T T I N G S',
            style: TextStyle(fontFamily: 'TenorSans'),
          ),
        ),
        const ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            'L O G O U T',
            style: TextStyle(fontFamily: 'TenorSans'),
          ),
        ),
      ],
    ),
  ),
);
