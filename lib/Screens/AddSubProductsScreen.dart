import 'package:elmolad_dashboard/Screens/AddSubProductScreen.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';

class AddSubProductsScreen extends StatefulWidget {
  static const routeName = "/AddSubProducts";
  @override
  _AddSubProductsScreenState createState() => _AddSubProductsScreenState();
}

class _AddSubProductsScreenState extends State<AddSubProductsScreen> {
  int i = 1;
  addMoreSubs() {
    setState(() {
      i++;
    });
  }

  navigateToMainScreen() {
    Navigator.of(context).popUntil((route) {
      print(route.settings.name);
      if (route.settings.name == "/" || route.settings.name == null) {
        return true;
      } else {
        return false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.keyboard_return_sharp)),
        ],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int k = 0; k < i; k++)
              Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  AddSubProductScreen(),
                ],
              ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonDesign("add more", addMoreSubs),
                SizedBox(
                  width: 30,
                ),
                ButtonDesign("done", navigateToMainScreen),
              ],
            )
          ],
        ),
      ),
    );
  }
}
