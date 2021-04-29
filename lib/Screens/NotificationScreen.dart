import 'dart:convert';

import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = "/Notification";
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get()async{
    UserData userData = Provider.of<UserData>(context , listen: false);
    var response = await http.get(
        Uri.parse('$serverURL/api/Notification/AllNotificationList'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization' : 'Bearer ${userData.userData["access_token"]}'
        },
    );

    setState(() {
      data = jsonDecode(response.body);
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double headerFontSize = size.width > 600 ? 20 : 8;
    double rowFontSize = size.width > 600 ? 20 : 9;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Notification" , style: TextStyle(color: Colors.black),),
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
          children: [
            Container(
              width: size.width,
              height: size.height - 150,
              child: DataTable(
                showCheckboxColumn: false,
                columnSpacing: 10,
                columns: [
                  DataColumn(
                      label: Text('Date',
                        style: TextStyle(
                          fontSize: headerFontSize,
                          fontWeight: FontWeight.bold,),maxLines: 3,)),
                  DataColumn(
                      label: Text('Message',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),


                ],
                rows: [
                  for(int i = 0; i < data.length ; i++)
                  DataRow(
                      cells: [
                        DataCell(Text(data[i]["Date"].substring(0 , 10),
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                        DataCell(Text(data[i]["Body"],
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
