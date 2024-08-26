import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/constants.dart';
import '../components/drawer.dart';
import '../components/tabbar.dart';
import '../components/textss.dart';
import '../tabs/first_and_forth_tab.dart';
import '../tabs/second_and_third_tab.dart';

class NewArrival extends ConsumerWidget {
  const NewArrival({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = PageController();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextWidget(size: 22, text: newArrival, color: Colors.black,fontFamily: 'TenorSans',),

          centerTitle: true,
          bottom: const TabbarExample(),
        ),
        drawer: const MyTabbedDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: TabBarView(
                  children: [
                    FirstAndForthTab(
                      controller: controller,
                      collectionNames: const ['Leather', 'Dress', 'Outer', 'Glasses', 'Hat', 'Tshirts', 'Fancy'],
                    ),
                    SecondAndThirdTab(
                      controller: controller,
                      collectionName: 'Dress',
                    ),
                    SecondAndThirdTab(
                      controller: controller,
                      collectionName: 'Outer',
                    ),
                    FirstAndForthTab(
                      controller: controller,
                      collectionNames: const ['Leather', 'Fancy'],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
