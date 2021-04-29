import 'dart:convert';

import 'package:elmolad_dashboard/Alerts/loadingAlert.dart';
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Screens/AddStoreScreen.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

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
                          hoverColor: Colors.black.withOpacity(0.4),
                          child: Container(
                              width: 40,
                              height: 60,
                              child: Icon(Icons.add_circle_rounded)),
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) =>
                                    AddStoreScreen()));
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
                          hoverColor: Colors.black.withOpacity(0.4),
                          child: Container(
                              width: 40,
                              height: 50,
                              child: Icon(Icons.delete_forever_outlined)),
                          onTap: () => deleteStore(data[i]),
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
  deleteStore(dataParameter)async{
    UserData userData = Provider.of<UserData>(context , listen: false);
    List filter = [];
    loadingAlert(context);
    var response = await http.post(
      Uri.parse("$serverURL/api/Store/Delete?id=${dataParameter["id"]}"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer ${userData.userData["access_token"]}'

      },
    );
    Navigator.of(context).pop();
    if(response.statusCode < 300){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("the store has been deleted successfully") , backgroundColor: Colors.green,));
      data.forEach((element) {
        if(element["id"] == dataParameter["id"]){

        }else{
          filter.add(element);
        }
      });
      print(filter);
      setState(() {
        data = filter;
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("something went wrong"),backgroundColor: Colors.red,));
    }
  }
}
