import 'dart:convert';

import 'package:elmolad_dashboard/Alerts/loadingAlert.dart';
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/Screens/OrderDetailsScreen.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/PaginationWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrdersScreen extends StatefulWidget {
  static const routeName = "/OrdersScreen";
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Map paging = {};
  List data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()async{
    var response = await http.get(
        Uri.parse('$serverURL/api/OrderCpanel/List?pageNo=1&pageSize=5'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
    );
    print(response.body);
    Map body = jsonDecode(response.body);
    setState(() {
      data = body["Data"];
      paging = body["Paging"];
    });
  }
  onClick(url) async {
    loadingAlert(context);
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    Navigator.of(context).pop();
    print(response.body);
    Map body = jsonDecode(response.body);
    setState(() {
      data = body["Data"];
      paging = body["Paging"];
    });

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double headerFontSize = size.width > 600 ? 20 : 11;
    double rowFontSize = size.width > 600 ? 20 : 12;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Orders" , style: TextStyle(color: Colors.black),),
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
                columnSpacing: 25,
                columns: [
                  DataColumn(
                      label: Text('order id',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('date',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('User name',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Total price',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                ],
                rows: [
                  for(int i = 0 ; i < data.length ; i++)
                  DataRow(
                      onSelectChanged: (value) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) =>
                                OrderDetailsScreen(data[i]["orderId"])));
                      },
                      cells: [
                        DataCell(Text(data[i]["orderId"].toString(),
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                        DataCell(Text(data[i]["date"].substring(0,10),
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                        DataCell(Text(data[i]["userName"],
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                        DataCell(Text((data[i]["productCount"]*data[i]["price"]).toString(),
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                      ]),

                ],
              ),
            ),
            PaginationWidget(paging["previous"] , paging["next"] , onClick),
          ],
        ),
      ),
    );
  }
}
