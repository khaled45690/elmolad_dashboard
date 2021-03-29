import 'dart:convert';

import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/Screens/OrderDetailsScreen.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/PaginationWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReviewsScreen extends StatefulWidget {
  static const String routeName = "/Reviews";
  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  List? dataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  void get() async {
    var response = await http.get(
      Uri.parse('$serverURL/api/Review/AllReview'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    print(response.body);
    setState(() {
      dataList = jsonDecode(response.body);
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
              child: SingleChildScrollView(
                child: DataTable(
                  showCheckboxColumn: false,
                  columnSpacing: 25,
                  columns: [
                    DataColumn(
                        label: Text('User Name',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('review',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Date',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('rate',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold))),

                  ],
                  rows: [
                    for(int i = 0; i < dataList!.length ; i++)
                    DataRow(
                        onSelectChanged: (value) {
                          Navigator.of(context)
                              .pushNamed(OrderDetailsScreen.routeName);
                        },
                        cells: [
                          DataCell(Text(dataList![i]["userName"],
                              style: TextStyle(
                                fontSize: rowFontSize,
                              ))),
                          DataCell(Text(dataList![i]["review"],
                              style: TextStyle(
                                fontSize: rowFontSize,
                              ),),),
                          DataCell(Text(dataList![i]["dat"].substring(0 , 10),
                              style: TextStyle(
                                fontSize: rowFontSize,
                              ))),
                          DataCell(Text(dataList![i]["rate"].toString(),
                              style: TextStyle(
                                fontSize: rowFontSize,
                              ))),

                        ]),

                  ],
                ),
              ),
            ),
            PaginationWidget("" , "" , (){}),
          ],
        ),
      ),
    );
  }
}
