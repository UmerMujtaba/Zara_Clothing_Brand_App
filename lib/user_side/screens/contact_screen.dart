import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/button.dart';
import '../components/constants.dart';
import '../components/drawer.dart';
import '../components/footer.dart';
import '../components/line.dart';
import '../components/textss.dart';
import '404_screen.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppbar,
      drawer: const MyTabbedDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              const SizedBox(height: 40),

              TextWidget(size: 22, text: contactUs, color: Colors.black,letterSpacing: 2,fontFamily: 'TenorSans',),

              CustomPaint(
                size: const Size(250, 50), // Adjust size as needed
                painter: LineWithDiamondPainter(),
              ),
              const Image(
                image: AssetImage('assets/icons/messenger.png'),
              ),
              const SizedBox(height: 20),
              TextWidget(size: 14, text: contactUsViaChat, color: Colors.black,fontFamily: 'TenorSans',),
              const SizedBox(height: 20),
              Button3(
                text: chatWithUs,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ErrorScreen()));
                },
              ),
              const SizedBox(height: 20),
              const Image(
                image: AssetImage('assets/icons/email.png'),
              ),
              const SizedBox(height: 20),
              TextWidget(size: 14, text: contactUsDetailText, color: Colors.black,fontFamily: 'TenorSans',),

              const SizedBox(height: 20),
              Button3(
                text: 'TEXT US',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ErrorScreen()));
                },
              ),
              const SizedBox(height: 20),
              const Image(
                image: AssetImage('assets/icons/twitter.png'),
              ),
              const SizedBox(height: 20),
              TextWidget(size: 14, text: contactUsPrivateDetailText, color: Colors.black,fontFamily: 'TenorSans',),

              const SizedBox(height: 40),
              const Footer(),
            ]),
          ),
        ),
      ),
    );
  }
}
