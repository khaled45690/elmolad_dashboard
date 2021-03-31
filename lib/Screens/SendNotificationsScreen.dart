import 'package:elmolad_dashboard/Alerts/loadingAlert.dart';
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/StateDependentClasses/AddStoreScreenState.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendNotificationScreen extends StatefulWidget {
  static const String routeName = "/SendNotification";
  @override
  _SendNotificationScreenState createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> {

  Map data = {
    "header" : null,
    "Message" : null,
  };
  Map dataError = {
    "header" : null,
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
        title: Text("send notifications" , style: TextStyle(color: Colors.black),),
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
                    child: CustomTextField("header", dataError["header"], (value) { asss.onChange(value, "header"); })),
                Container(
                    width: 300,
                    child: CustomTextField("Message", dataError["Message"], (value) { asss.onChange(value, "Message"); })),
               SizedBox(
                  height: 40,
                ),
                ButtonDesign("Send", sendNotification),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendNotification()async{
    AddStoreScreenState asss = new AddStoreScreenState(this);
    if(asss.check()){
      loadingAlert(context);
      var response = await http.post(
          Uri.parse('$serverURL/api/Notification/Add?header=${data["header"]}&body=${data["Message"]}'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
      );
      Navigator.of(context).pop();
      if(response.statusCode < 300){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("the Notification has been sent successfully") ,backgroundColor: Colors.green,));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("something went wrong"),backgroundColor: Colors.red,));
      }
      print(response.statusCode);
      print(response.body);
    }
  }
}
