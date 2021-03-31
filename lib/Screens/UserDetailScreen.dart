import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/UserDetailsLowerPart.dart';
import 'package:elmolad_dashboard/Widgets/UserDetailsUpperPart.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  static const String routeName = "/UserDetailsScreen";
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("users details" , style: TextStyle(color: Colors.black),),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserDetailsUpperPart(),
            SizedBox(
              height: 30,
            ),
            Text(
              "Product bought",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 4),
            ),
            SizedBox(
              height: 30,
            ),
            UserDetailsLowerPart(),
          ],
        ),
      ),
    );
  }
}
