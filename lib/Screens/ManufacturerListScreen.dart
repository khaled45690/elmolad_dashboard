import 'dart:convert';

import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Screens/AddManufacturScreen.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class ManufacturListScreen extends StatefulWidget {
  static const String routeName = "/BrandListScreen";
  @override
  _ManufacturListScreenState createState() => _ManufacturListScreenState();
}

class _ManufacturListScreenState extends State<ManufacturListScreen> {
  List? dataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  void get() async {
    UserData userData = Provider.of<UserData>(context , listen: false);
    var response = await http.get(
      Uri.parse('$serverURL/api/BrandCpanel/list'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer ${userData.userData["access_token"]}'
      },
    );
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
        title: Text("all manufactures" , style: TextStyle(color: Colors.black),),
        actions: [
          MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.keyboard_return_sharp)),
        ],
      ),
      drawer: DrawerWidget(),
      body: Container(
        width: size.width,
        height: size.height - 150,
        child: SingleChildScrollView(
          child: DataTable(
            showCheckboxColumn: false,
            columnSpacing: 30,
            dataRowHeight: 100,
            columns: [
              DataColumn(
                  label: Text('Id',
                      style: TextStyle(
                          fontSize: headerFontSize,
                          fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Brand Name',
                      style: TextStyle(
                          fontSize: headerFontSize,
                          fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Image',
                        style: TextStyle(
                            fontSize: headerFontSize,
                            fontWeight: FontWeight.bold)),
                    InkWell(
                      hoverColor: Colors.black.withOpacity(0.4),
                      child: Container(
                          width: 40,
                          height: 50,
                          child: Icon(Icons.add_circle_rounded)),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AddManufacturScreen.routeName);
                      },
                    ),
                  ],
                ),
              )),
            ],
            rows: [
              for(int i = 0 ; i < dataList!.length ; i++)
              DataRow(
                  cells: [
                DataCell(
                    Text(dataList![i]["Id"].toString(),
                        style: TextStyle(
                          fontSize: rowFontSize,
                        ))),
                DataCell(Text(dataList![i]["brandName"].toString(),
                    style: TextStyle(
                      fontSize: rowFontSize,
                    ))),
                    DataCell(Image.network("$serverURL/img/products/${dataList![i]["imgName"]}" , height: 50, width: 50,),
                    )]),
            ],
          ),
        ),
      ),
    );
  }
}
