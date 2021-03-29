import 'package:elmolad_dashboard/StateDependentClasses/AddStoreScreenState.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';

class SendNotificationScreen extends StatefulWidget {
  static const String routeName = "/SendNotification";
  @override
  _SendNotificationScreenState createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> {

  Map data = {
    "Address" : null,
    "Message" : null,
  };
  Map dataError = {
    "Address" : null,
    "Message" : null,
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
          width: 400,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: 300,
                    child: CustomTextField("Address", dataError["Address"], (value) { asss.onChange(value, "UserName"); })),
                Container(
                    width: 300,
                    child: CustomTextField("Message", dataError["Message"], (value) { asss.onChange(value, "StoreName"); })),
               SizedBox(
                  height: 40,
                ),
                ButtonDesign("Send", asss.addStore),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
