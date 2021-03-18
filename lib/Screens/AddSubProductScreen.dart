import 'package:elmolad_dashboard/StateDependentClasses/AddSubProductScreenState.dart';
import 'package:elmolad_dashboard/Widgets/AddSubProductTopPart.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:flutter/material.dart';

class AddSubProductScreen extends StatefulWidget {
  @override
  _AddSubProductScreenState createState() => _AddSubProductScreenState();
}

class _AddSubProductScreenState extends State<AddSubProductScreen> {
  @override
  Widget build(BuildContext context) {
    AddSubProductScreenState aspss = new AddSubProductScreenState(this);
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          width: 400,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(""),
              AddSubProductTopPart(),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
              ),
              ButtonDesign("Select images", aspss.loadAssets),
              SizedBox(
                height: 30,
              ),
              ButtonDesign("Submit", () {}),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
