import 'package:elmolad_dashboard/StateDependentClasses/AddStoreScreenState.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';

class AddStoreScreen extends StatefulWidget {
  static const String routeName = "/AddStore";
  @override
  _AddStoreScreenState createState() => _AddStoreScreenState();
}

class _AddStoreScreenState extends State<AddStoreScreen> {
  Map data = {
    "UserName" : null,
    "StoreName" : null,
    "Address" : null,
    "Email" : null,
    "Password" : null,
    "ConfirmPassword" : null,
  };
  Map dataError = {
    "UserName" : null,
    "StoreName" : null,
    "Address" : null,
    "Email" : null,
    "Password" : null,
    "ConfirmPassword" : null,
  };
  @override
  Widget build(BuildContext context) {
    AddStoreScreenState asss = new AddStoreScreenState(this);
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
                    child: CustomTextField("User name", dataError["UserName"], (value) { asss.onChange(value, "UserName"); })),
                Container(
                    width: 300,
                    child: CustomTextField("Store name", dataError["StoreName"], (value) { asss.onChange(value, "StoreName"); })),
                Container(
                    width: 300,
                    child: CustomTextField("Address", dataError["Address"], (value) { asss.onChange(value, "Address"); })),
                Container(
                    width: 300,
                    child: CustomTextField("Email", dataError["Email"], (value) { asss.onChange(value, "Email"); })),
                Container(
                    width: 300,
                    child: CustomTextField("Password", dataError["Password"], (value) { asss.onChange(value, "Password"); } , obscureText: true,)),
                Container(
                    width: 300,
                    child:
                        CustomTextField("Confirm password", dataError["ConfirmPassword"], (value) { asss.onChange(value, "ConfirmPassword");} , obscureText: true)),
                SizedBox(
                  height: 40,
                ),
                ButtonDesign("Add Store", asss.addStore),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
