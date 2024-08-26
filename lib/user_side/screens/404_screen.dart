import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/button.dart';
import '../components/constants.dart';
import '../components/drawer.dart';
import '../components/footer.dart';
import '../components/line.dart';
import '../components/textss.dart';
import 'new_arrival.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar,
      drawer: const MyTabbedDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              const SizedBox(height: 40),

              TextWidget(size: 22, text: pageNotFound, color: Colors.black,letterSpacing: 2),
              TextWidget(size: 22, text: pageNotFound, color: Colors.black,letterSpacing: 2),

              CustomPaint(
                size: const Size(250, 50), // Adjust size as needed
                painter: LineWithDiamondPainter(),
              ),
              const Image(
                image: AssetImage('lib/icons/girl.png'),
              ),
              const SizedBox(height: 20),
              TextWidget(size: 14, text: cantFindPageYouAreLookingFor, color: Colors.black,textAlign: TextAlign.center),

              const SizedBox(height: 20),
              Button3(
                text: 'HOME PAGE',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewArrival()));
                },
              ),
              const SizedBox(height: 40),
              const Footer(),
            ]),
          ),
        ),
      ),
    );
  }
}
