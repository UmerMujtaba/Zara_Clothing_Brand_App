import 'package:flutter/material.dart';
import 'package:zaraclothingbrand/components/button.dart';
import 'package:zaraclothingbrand/screens/homepage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    menuItem(String iconName, String title, VoidCallback onClick) {
      return GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),

                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                     fontFamily: 'TenorSans'
                    ),
                  ),
                ],
              ),
              Row(
                children: [

                  const SizedBox(width: 15),
                ],
              ),
            ],
          ),
        ),
      );
    }


    return Drawer(
      child: Container(
        color: Colors.red,
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  const EdgeInsets.only(left: 0, top: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                menuItem('ic-account', 'accountDetailsLabel',() {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ListenerProfile(),
                  //   ),
                  // );
                }),
                menuItem('ic-people', 'accountDetailsLabel', () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ListenerReaderList(),
                  //   ),
                  // );
                }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: MyButton(text: 'LOGOUT', onTap: (){ Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  MyHomePage()),
              );},),

            ),
          ],
        ),
      ),
    );
  }
}
