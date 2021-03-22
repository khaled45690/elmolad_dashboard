import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';

class AddSizeScreen extends StatefulWidget {
  static const routeName = "/AddSize";
  @override
  _AddSizeScreenState createState() => _AddSizeScreenState();
}

class _AddSizeScreenState extends State<AddSizeScreen> {
  Map data = {
    "SizeName":""
  };
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
    body: Center(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        width: 400,
        height: 200,
        child: Column(
          children: [
            Container(
                width: 300,
                child: CustomTextField("Size name", null, (value) { } )),
            SizedBox(
              height: 40,
            ),
            ButtonDesign("Add", (){}),
          ],
        ),
      ),
    ),
    );
  }
}
