import 'package:elmolad_dashboard/StateDependentClasses/AddSubProductScreenState.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';

class AddRoomScreen extends StatefulWidget {
  static const routeName = "/AddBrandScreen";
  @override
  _AddRoomScreenState createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenSize = size.width > 500 ? 500 : size.width;
    AddSubProductScreenState aspss = new AddSubProductScreenState(this);
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
          width: screenSize,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        margin: EdgeInsets.only(right: 30),
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                          width: 300,
                          child: CustomTextField("Name", null, (value) {})),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ButtonDesign("Select image", aspss.loadAssets),
                  SizedBox(
                    height: 200,
                  ),
                  ButtonDesign("add", () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
