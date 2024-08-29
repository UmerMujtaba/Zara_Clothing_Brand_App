import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/theme_provider.dart';
import 'edit_profile_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Settings',
          style: TextStyle(fontFamily: 'TenorSans'),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //dark mode
            children: [
              Text(
                'Dark Mode',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontFamily: 'TenorSans',
                ),
              ),

              //switch
              CupertinoSwitch(
                value: themeNotifier.isDarkMode,
                onChanged: (value) => themeNotifier.toggleTheme(),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
          padding: const EdgeInsets.all(25),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //dark mode
              children: [
                Text(
                  'Edit Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'TenorSans',
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfileScreen()));
                    },
                    icon: Icon(Icons.keyboard_arrow_right_outlined,
                        color: Theme.of(context).colorScheme.inversePrimary))
              ]),
        )
      ]),
    );
  }
}
