import 'package:flutter/material.dart';
import '../constants.dart';
import '../uploads/blog.dart';
import '../uploads/form.dart';
import '../uploads/total_data_screen.dart';
import '../uploads/update.dart';

enum AdminPanelScreen { welcome, formUpload, blogUpload, totalDataScreen,update }

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  AdminPanelScreen _currentScreen = AdminPanelScreen.welcome;
  String _selectedItemName = '';
  int touchedIndex = -1;


  void _selectScreen(AdminPanelScreen screen, [String itemName = '']) {
    setState(() {
      _currentScreen = screen;
      _selectedItemName = itemName;
    });
    print(_selectedItemName);
  }



  Widget _buildCurrentScreen() {
    switch (_currentScreen) {
      case AdminPanelScreen.formUpload:
        return FormUpload(itemName: _selectedItemName);

      case AdminPanelScreen.blogUpload:
        return BlogUpload(itemName: _selectedItemName);

      // New case for total data screen
      case AdminPanelScreen.totalDataScreen: // New case for total data screen
        return TotalDataScreen();

      case AdminPanelScreen.update:
      return Update();




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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      appBar: myAppBar,
      body: Row(
        children: [
          myDrawer, // Customize your drawer as needed
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildCurrentScreen(),
            ),
          ),
        ],
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
                        onTap: () => _selectScreen(
                            AdminPanelScreen.formUpload, 'Leather'),
                      ),
                      ListTile(
                        title: const Text(
                          'F A N C Y',
                          style: TextStyle(fontFamily: 'TenorSans'),
                        ),
                        onTap: () =>
                            _selectScreen(AdminPanelScreen.formUpload, 'Fancy'),
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
                        onTap: () => _selectScreen(
                            AdminPanelScreen.formUpload, 'Glasses'),
                      ),
                      ListTile(
                        title: const Text(
                          'H A T',
                          style: TextStyle(fontFamily: 'TenorSans'),
                        ),
                        onTap: () =>
                            _selectScreen(AdminPanelScreen.formUpload, 'Hat'),
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
                        onTap: () =>
                            _selectScreen(AdminPanelScreen.formUpload, 'Outer'),
                      ),
                      ListTile(
                        title: const Text(
                          'T S H I R T S',
                          style: TextStyle(fontFamily: 'TenorSans'),
                        ),
                        onTap: () => _selectScreen(
                            AdminPanelScreen.formUpload, 'Tshirts'),
                      ),
                      ListTile(
                        title: const Text(
                          'D R E S S',
                          style: TextStyle(fontFamily: 'TenorSans'),
                        ),
                        onTap: () =>
                            _selectScreen(AdminPanelScreen.formUpload, 'Dress'),
                      ),
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
                onTap: () => _selectScreen(AdminPanelScreen
                    .totalDataScreen), // Navigate to totalDataScreen
              ),
               ListTile(
                leading: const Icon(Icons.update),
                title: const Text(
                  'U P D A T E',
                  style: TextStyle(fontFamily: 'TenorSans'),
                ),
                onTap: () => _selectScreen(AdminPanelScreen
                    .update),
              ),
              ListTile(
                leading: const Icon(Icons.post_add_outlined),
                title: const Text(
                  'A D D B L O G',
                  style: TextStyle(fontFamily: 'TenorSans'),
                ),
                onTap: () => _selectScreen(AdminPanelScreen.blogUpload, 'Blog'),
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
