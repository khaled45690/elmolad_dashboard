import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/EditMainProductTopPart.dart';
import 'package:flutter/material.dart';

class EditMainProductScreen extends StatefulWidget {
  static const String routeName = "/EditMainProduct";
  @override
  _EditMainProductScreenState createState() => _EditMainProductScreenState();
}

class _EditMainProductScreenState extends State<EditMainProductScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EditMainProductTopPart(),
            SizedBox(height: 40,),
            ButtonDesign("Save", () {}),
          ],
        ),
      ),
    );
  }
}
