import 'package:elmolad_dashboard/StateDependentClasses/AddMainProductScreenState.dart';
import 'package:elmolad_dashboard/Widgets/AddMainProductMiddlePart.dart';
import 'package:elmolad_dashboard/Widgets/AddMainProductTopPart.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';

class AddMainProductScreen extends StatefulWidget {
  static const routeName = "/AddMainProductDetailsScreen";

  @override
  _AddMainProductScreenState createState() => _AddMainProductScreenState();
}

class _AddMainProductScreenState extends State<AddMainProductScreen> {
  @override
  Widget build(BuildContext context) {
    AddMainProductScreenState ampss =
        new AddMainProductScreenState(this, context);
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
            AddMainProductTopPart(),
            SizedBox(
              height: 30,
            ),
            AddMainProductMiddlePart(),
            SizedBox(
              height: 30,
            ),
            ButtonDesign("Next", ampss.onSubmitFunc),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}