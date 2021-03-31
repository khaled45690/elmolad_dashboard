import 'dart:convert';

import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/Screens/AddStoreScreen.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/PaginationWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StoresListScreen extends StatefulWidget {
  static const String routeName = "/StoresListScreen";
  @override
  _StoresListScreenState createState() => _StoresListScreenState();
}

class _StoresListScreenState extends State<StoresListScreen> {
  List data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get()async{
    var response = await http.get(
      Uri.parse('$serverURL/api/Store/list'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    print('response.body');
    print(response.statusCode);
    List x = jsonDecode(response.body);
    setState(() {
      data = jsonDecode(response.body);
    });
    print(x);
    x.forEach((element) {
      print(element);
    });
    print('response.body');

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double headerFontSize = size.width > 600 ? 15 : 8;
    double rowFontSize = size.width > 600 ? 15 : 8;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Stores" , style: TextStyle(color: Colors.black),),
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
                columnSpacing: 30,
                columns: [
                  DataColumn(
                      label: Text('id',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Store Name',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Number of Product',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('image',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold)),
                        InkWell(
                          child: Icon(Icons.add_circle_rounded),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AddStoreScreen.routeName);
                          },
                        ),
                      ],
                    ),
                  )),
                ],
                rows: [
                  for(int i = 0 ; i < data.length ; i++)
                  DataRow(cells: [
                    DataCell(Row(
                      children: [
                        InkWell(
                          child: Icon(Icons.delete_forever_outlined),
                          onTap: () {
                            print("hi");
                          },
                        ),
                        Text(data[i]["id"].toString(),
                            style: TextStyle(
                              fontSize: rowFontSize,
                            )),
                      ],
                    )),
                    DataCell(Text(data[i]["storeName"],
                        style: TextStyle(
                          fontSize: rowFontSize,
                        ))),
                    DataCell(Text(data[i]["numOfProdduct"].toString(),
                        style: TextStyle(
                          fontSize: rowFontSize,
                        ))),
                    DataCell(Image.network("$serverURL/img/products/${data[i]["img"]}" , height: 50, width: 50,)),
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
