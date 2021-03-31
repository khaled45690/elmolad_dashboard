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
    "storeName" : null,
    "phoneNumber" : null,
    "Email" : null,
    "password" : null,
    "imgName" : null,
    "confirmPassword" : null,
  };
  Map dataError = {
    "storeName" : null,
    "phoneNumber" : null,
    "Email" : null,
    "password" : null,
    "imgName" : null,
    "confirmPassword" : null,
  };
  @override
  Widget build(BuildContext context) {
    AddStoreScreenState asss = new AddStoreScreenState(this);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Add Store" , style: TextStyle(color: Colors.black),),
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
                    child: CustomTextField("Store name", dataError["storeName"], (value) { asss.onChange(value, "storeName"); })),
                Container(
                    width: 300,
                    child: CustomTextField("phoneNumber", dataError["phoneNumber"], (value) { asss.onChange(value, "phoneNumber"); })),
                Container(
                    width: 300,
                    child: CustomTextField("Email", dataError["Email"], (value) { asss.onChange(value, "Email"); })),
                Container(
                    width: 300,
                    child: CustomTextField("Password", dataError["password"], (value) { asss.onChange(value, "password"); } , obscureText: true,)),
                Container(
                    width: 300,
                    child:
                        CustomTextField("Confirm password", dataError["confirmPassword"], (value) { asss.onChange(value, "confirmPassword");} , obscureText: true)),
                SizedBox(
                  height: 40,
                ),
                ButtonDesign("Select images", asss.loadAssets),

                dataError["imgName"] == null ? Container() : Text("please add an image to continue" , style: TextStyle(color: Colors.red),),
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
