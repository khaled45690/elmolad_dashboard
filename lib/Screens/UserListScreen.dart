import 'dart:convert';

import 'package:elmolad_dashboard/Alerts/loadingAlert.dart';
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Screens/UserDetailScreen.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/PaginationWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class UsersListScreen extends StatefulWidget {
  static const String routeName = "/UsersListScreen";
  @override
  _UsersListScreenState createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  List data = [];
  Map paging = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()async{
    UserData userData = Provider.of<UserData>(context , listen: false);
    var response = await http.get(
      Uri.parse('$serverURL/api/Client/list?pageSize=1&pageNo=1'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer ${userData.userData["access_token"]}'
      },
    );
    Map body = jsonDecode(response.body);
    setState(() {
       data = body["Data"];
       paging = body["Paging"];
    });
    print(response.body);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double headerFontSize = size.width > 600 ? 20 : 12;
    double rowFontSize = size.width > 600 ? 20 : 12;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("users" , style: TextStyle(color: Colors.black),),
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
                      label: Text('User Name',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('count order',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('address',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold)),
                        // InkWell(child: Icon(Icons.add_circle_rounded), onTap: (){Navigator.of(context).pushNamed(AddStoreScreen.routeName);},),
                      ],
                    ),
                  )),
                ],
                rows: [
                  for(int i = 0; i < data.length ; i++)
                  DataRow(
                      onSelectChanged: (value) {
                        Navigator.of(context)
                            .pushNamed(UserDetailsScreen.routeName);
                      },
                      cells: [
                        DataCell(Row(
                          children: [
                            InkWell(
                              child: Icon(Icons.delete_forever_outlined),
                              onTap: () {
                                print("hi");
                              },
                            ),
                            Text(data[i]["userName"],
                                style: TextStyle(
                                  fontSize: rowFontSize,
                                )),
                          ],
                        )),
                        DataCell(Text(data[i]["countOrder"].toString(),
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                        DataCell(Text(
                          data[i]["address"].toString(),
                          style: TextStyle(
                            fontSize: rowFontSize,
                          ),
                        )),
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
  onClick(url) async {
    UserData userData = Provider.of<UserData>(context , listen: false);
    loadingAlert(context);
    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer ${userData.userData["access_token"]}'
      },
    );
    Navigator.of(context).pop();
    Map body = jsonDecode(response.body);
    setState(() {
      data = body["Data"];
      paging = body["Paging"];
    });

  }
}
