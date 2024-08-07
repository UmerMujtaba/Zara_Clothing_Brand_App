// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../components/button.dart';
import 'new_arrival.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  var size, height, width;

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('Open',style: TextStyle(
              fontFamily: 'TenorSans',color: Colors.black,fontSize: 22
            ),),
            Text('Fashion',style: TextStyle(
                fontFamily: 'TenorSans',color: Colors.black,fontSize: 24
            ),),
          ],
        ),
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined)),
        ],
      ),

      body: Stack(
        children: <Widget>[
          SizedBox(
            height: height,
            child: const Image(
              image: AssetImage('lib/images/backgroundimage.png'),
              filterQuality: FilterQuality.high,
              fit: BoxFit.fitHeight,
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Opacity(
                opacity: 0.7,
                child: Text(
                  'LUXURY\n   FASHION\n& ACCESSORIES',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 46,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'PTSerif'),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            child: MyButton(
              text: 'EXPLORE COLLECTION',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewArrival(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
