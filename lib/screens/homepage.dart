import 'package:flutter/material.dart';

import '../components/button.dart';
import 'new_arrival.dart';

class MyHomePage extends StatelessWidget {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('Open',style: TextStyle(
              fontFamily: 'TenorSans',color: Colors.black,fontSize: 22
            ),),
            const Text('Fashion',style: TextStyle(
                fontFamily: 'TenorSans',color: Colors.black,fontSize: 24
            ),),
          ],
        ),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
        ],
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: height,
            child: Image(
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
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
