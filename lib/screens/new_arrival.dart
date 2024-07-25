import 'package:flutter/material.dart';
import '../components/item_container.dart';
import '../components/line.dart';
import '../components/tabbar.dart';
import '../model/item_model.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'NEW ARRIVAL',
            style: TextStyle(
              fontFamily: 'TenorSans',
              color: Colors.black,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          bottom: const TabbarExample(),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 270,

                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0, // Adjusted
                      ),
                      itemCount: items.length, // Number of items
                      itemBuilder: (context, index) {
                        return ItemContainer(item: items[index]);
                      },
                    ),
                  ),
                  Center(
                    child: Text("Apparel"),
                  ),
                  Center(
                    child: Text("Dress"),
                  ),
                  Center(
                    child: Text("Bag"),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Explore More',
                    style: TextStyle(
                        fontFamily: 'TenorSans',
                        color: Colors.black,
                        fontSize: 22),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            CustomPaint(
              size: Size(300, 100), // Adjust size as needed
              painter: LineWithDiamondPainter(),
            ),
            Column(
              children: [
                Row(
                  children: [

                  ],
                ),
                Row(
                  children: [],
                ),
              ],
            ),
            CustomPaint(
              size: Size(300, 100), // Adjust size as needed
              painter: LineWithDiamondPainter(),
            ),
          ],
        ),
      ),
    );
  }
}
