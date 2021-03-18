import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';

class AddStoreScreen extends StatefulWidget {
  static const String routeName = "/AddStoreScreen";
  @override
  _AddStoreScreenState createState() => _AddStoreScreenState();
}

class _AddStoreScreenState extends State<AddStoreScreen> {
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
          width: 600,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: 300,
                    child: CustomTextField("User name", null, (value) {})),
                Container(
                    width: 300,
                    child: CustomTextField("Store name", null, (value) {})),
                Container(
                    width: 300,
                    child: CustomTextField("Address", null, (value) {})),
                Container(
                    width: 300,
                    child: CustomTextField("Email", null, (value) {})),
                Container(
                    width: 300,
                    child: CustomTextField("Password", null, (value) {})),
                Container(
                    width: 300,
                    child:
                        CustomTextField("Confirm password", null, (value) {})),
                SizedBox(
                  height: 40,
                ),
                ButtonDesign("Add Store", () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
