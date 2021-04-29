
import 'dart:async';
import 'dart:convert';

import 'package:elmolad_dashboard/Alerts/loadingAlert.dart';
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class EditSizeScreen extends StatefulWidget {
  final Map data;

  const EditSizeScreen(this.data);
  @override
  _EditSizeScreenState createState() => _EditSizeScreenState();
}

class _EditSizeScreenState extends State<EditSizeScreen> {
  Map data = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data);
    setState(() {
      data["Name"] = widget.data["name"];
      data["PK_Size"] = widget.data["id"];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Add Size" , style: TextStyle(color: Colors.black),),
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
          height: 260,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Size Name :"),
                  Container(
                      width: 250,
                      child: CustomTextField(widget.data["name"], null, sizeChange)),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              ButtonDesign("Edit", submit),
            ],
          ),
        ),
      ),
    );
  }

  sizeChange(sizeValue) {
    setState(() {
      data["Name"] = sizeValue;
    });
  }

  submit()async{
    UserData userData = Provider.of<UserData>(context , listen: false);
    print(data);
    loadingAlert(context);
    print(Uri.parse("$serverURL/api/Size/Edit"));
    var response = await http.post(
      Uri.parse("$serverURL/api/Size/Edit"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authentication' : 'Bearer ${userData.userData["access_token"]}'
      },
      body:jsonEncode(data),
    );
    Navigator.of(context).pop();
    if(response.statusCode < 300){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("the Size has been added successfully") ,backgroundColor: Colors.green,));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("something went wrong"),backgroundColor: Colors.red,));
    }
    Timer(Duration(milliseconds: 200), (){
      if(response.statusCode < 300){
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      }
    });
    print(response.statusCode);
    print(response.body);
  }
}
