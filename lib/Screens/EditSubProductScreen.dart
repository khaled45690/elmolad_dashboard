import 'package:elmolad_dashboard/Widgets/AddSubProductTopPart.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';

class EditSubProductScreen extends StatefulWidget {
  static const String routeName = "/EditSubProduct";
  @override
  _EditSubProductScreenState createState() => _EditSubProductScreenState();
}

class _EditSubProductScreenState extends State<EditSubProductScreen> {
  @override
  Widget build(BuildContext context) {
    // ☺️
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
        child: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1, //                   <--- border width here
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AddSubProductTopPart(),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonDesign("Add images", (){}),
                SizedBox(
                  height: 30,
                ),
                ButtonDesign("Save", () {}),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
