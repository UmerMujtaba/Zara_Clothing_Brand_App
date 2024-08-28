import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../user_side/components/app_bar.dart';
import '../constants.dart';
import '../uploads/blog.dart';
import '../uploads/form.dart';
import 'desktop_scaffold.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({super.key});

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  AdminPanelScreen _currentScreen = AdminPanelScreen.welcome;
  String _selectedItemName = '';
  void _selectScreen(AdminPanelScreen screen, [String itemName = '']) {
    setState(() {
      _currentScreen = screen;
      _selectedItemName = itemName;
    });
    print(_selectedItemName);
  }

  Future<Map<String, int>> _fetchCollectionCounts() async {
    List<String> collections = [
      'Leather',
      'Dress',
      'Outer',
      'Glasses',
      'Hat',
      'Tshirts',
      'Fancy'
    ];
    Map<String, int> collectionCounts = {};

    for (String collection in collections) {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection(collection).get();
      collectionCounts[collection] = querySnapshot.size;
    }

    return collectionCounts;
  }

  Widget _buildCurrentScreen() {
    switch (_currentScreen) {
      case AdminPanelScreen.formUpload:
        return FormUpload(itemName: _selectedItemName);

      case AdminPanelScreen.blogUpload:
        return BlogUpload(itemName: _selectedItemName);

    // New case for total data screen
      case AdminPanelScreen.totalDataScreen: // New case for total data screen
        return FutureBuilder<Map<String, int>>(
          future: _fetchCollectionCounts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error fetching data'));
            } else if (snapshot.hasData) {
              Map<String, int> collectionCounts = snapshot.data!;
              int _hoveredIndex = -1;

              // Function to assign different colors


              List<PieChartSectionData> pieSections = collectionCounts.entries.map((entry) {
                int index = collectionCounts.keys.toList().indexOf(entry.key);
                final isHovered = index == _hoveredIndex;
                final double radius =  60;
                final double fontSize = 13;

                return PieChartSectionData(
                  color: _getColor(index),
                  value: entry.value.toDouble(),
                  title: '${entry.key}\n${entry.value}',
                  radius: radius,
                  titleStyle: TextStyle(
                    fontFamily: 'TenorSans',
                    fontSize: fontSize,
                    color: Colors.black,

                  ),
                );
              }).toList();

              return SingleChildScrollView(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'T O T A L I T E M S',
                      style: TextStyle(
                        fontFamily: 'TenorSans',
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // Pie chart
                            SizedBox(
                              height: 200,
                              child: PieChart(
                                PieChartData(
                                  sections: pieSections,
                                  borderData: FlBorderData(show: false),
                                  sectionsSpace: 2,
                                  centerSpaceRadius: 50,
                                  titleSunbeamLayout: true,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            // List of collections with item counts
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: collectionCounts.length,
                              itemBuilder: (context, index) {
                                String collectionName = collectionCounts.keys.elementAt(index);
                                int itemCount = collectionCounts.values.elementAt(index);
                                return Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        collectionName,
                                        style: const TextStyle(
                                          fontFamily: 'TenorSans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '$itemCount items',
                                        style: const TextStyle(
                                          fontFamily: 'TenorSans',
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        );




      case AdminPanelScreen.welcome:
      default:
        return const Center(
          child: Text(
            'W E L C O M E \n T O \n A D M I N PANEL\n',
            style: TextStyle(fontFamily: 'TenorSans', fontSize: 38),
            textAlign: TextAlign.center,
          ),
        );
    }
  }


  Color _getColor(int index) {
    List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.redAccent,
      Colors.purple,
      Colors.yellowAccent,
      Colors.cyan,
      Colors.pinkAccent
    ];
    return colors[index % colors.length];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      //appBar: myAppbar(),
      drawer: myDrawer,
     body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildCurrentScreen(),
      ),
    );
  }





  Widget get myDrawer => Drawer(
    backgroundColor: Colors.grey.shade500,
    child: SingleChildScrollView(
      child: Column(
        children: [
          const DrawerHeader(
              child: Image(image: AssetImage('assets/images/logo.png'))),
          ListTile(
            title: const Text('Welcome'),
            onTap: () => _selectScreen(AdminPanelScreen.welcome),
          ),
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
                      Navigator.pop(context);
                      _selectScreen(
                          AdminPanelScreen.formUpload, 'Leather');
                    }
                  ),
                  ListTile(
                    title: const Text(
                      'F A N C Y',
                      style: TextStyle(fontFamily: 'TenorSans'),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _selectScreen(AdminPanelScreen.formUpload, 'Fancy');
                    }
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
                      Navigator.pop(context);
                      _selectScreen(
                          AdminPanelScreen.formUpload, 'Glasses');
                    }
                  ),
                  ListTile(
                    title: const Text(
                      'H A T',
                      style: TextStyle(fontFamily: 'TenorSans'),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                        _selectScreen(AdminPanelScreen.formUpload, 'Hat');
                    }
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
                      Navigator.pop(context);
                      _selectScreen(AdminPanelScreen.formUpload, 'Outer');
                    }
                  ),
                  ListTile(
                    title: const Text(
                      'T S H I R T S',
                      style: TextStyle(fontFamily: 'TenorSans'),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _selectScreen(
                          AdminPanelScreen.formUpload, 'Tshirts');
                    }
                  ),
                  ListTile(
                    title: const Text(
                      'D R E S S',
                      style: TextStyle(fontFamily: 'TenorSans'),
                    ),
                    onTap: () {
                    Navigator.pop(context);
                        _selectScreen(AdminPanelScreen.formUpload, 'Dress');
                  })
                ],
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.view_in_ar),
            title: const Text(
              'V I E W',
              style: TextStyle(fontFamily: 'TenorSans'),
            ),
            onTap: () {
              Navigator.pop(context);
              _selectScreen(AdminPanelScreen
                  .totalDataScreen);
            }// Navigate to totalDataScreen
          ),
          const ListTile(
            leading: Icon(Icons.update),
            title: Text(
              'U P D A T E',
              style: TextStyle(fontFamily: 'TenorSans'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.post_add_outlined),
            title: const Text(
              'A D D B L O G',
              style: TextStyle(fontFamily: 'TenorSans'),
            ),
            onTap: () {
              Navigator.pop(context);
              _selectScreen(AdminPanelScreen.blogUpload, 'Blog');}
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
}
