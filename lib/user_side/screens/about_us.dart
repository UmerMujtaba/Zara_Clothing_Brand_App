import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/blog_container.dart';
import '../components/constants.dart';
import '../components/drawer.dart';
import '../components/email.dart';
import '../components/line.dart';
import '../components/textss.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: myAppbar(),
      drawer: const MyTabbedDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              const SizedBox(height: 40),
              TextWidget(
                size: 22,
                text: ourStoryHeading,
                color: Theme.of(context).colorScheme.inversePrimary,
                letterSpacing: 2,
                fontFamily: 'TenorSans',
              ),
              CustomPaint(
                size: const Size(250, 50), // Adjust size as needed
                painter: LineWithDiamondPainter(
                    lineColor: Theme.of(context).colorScheme.inversePrimary),
              ),
              TextWidget(
                size: 14,
                text: ourStoryDetail,
                color: Theme.of(context).colorScheme.inversePrimary,
                textAlign: TextAlign.justify,
                fontFamily: 'TenorSans',
              ),
              const BlogContainer(bgImage: 'assets/images/blog3.jpg', name: ''),
              const SizedBox(height: 40),
              TextWidget(
                size: 22,
                text: 'SIGN UP',
                color: Theme.of(context).colorScheme.inversePrimary,
                letterSpacing: 2,
                fontFamily: 'TenorSans',
              ),
              CustomPaint(
                size: const Size(250, 50), // Adjust size as needed
                painter: LineWithDiamondPainter(
                    lineColor: Theme.of(context).colorScheme.inversePrimary),
              ),
              const EmailForm(),
            ]),
          ),
        ),
      ),
    );
  }
}
