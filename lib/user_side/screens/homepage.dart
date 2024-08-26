// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/app_bar.dart';
import '../components/button.dart';
import '../components/constants.dart';
import '../components/textss.dart';
import 'new_arrival.dart';

// ignore: must_be_immutable
class MyHomePage extends ConsumerWidget {
  var size, height, width;

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: myAppbar,
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: height,
            child: const Image(
              image: AssetImage('assets/images/backgroundimage.png'),
              filterQuality: FilterQuality.high,
              fit: BoxFit.fitHeight,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Opacity(
                opacity: 0.7,
                child: TextWidget(
                    size: 46,
                    text: luxuryFashionAccessories,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PTSerif',

                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            child: MyButton(
              text: exploreCollection,
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
