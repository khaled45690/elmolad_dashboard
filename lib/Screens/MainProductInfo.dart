import 'dart:convert';

import 'package:elmolad_dashboard/Alerts/loadingAlert.dart';
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Screens/AddMainProductScreen.dart';
import 'package:elmolad_dashboard/Screens/EditMainProductScreen.dart';
import 'package:elmolad_dashboard/Screens/SubProductInfo.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/PaginationWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class MainProductInfo extends StatefulWidget {
  static const String routeName = "/MainProductInfo";
  @override
  _MainProductInfoState createState() => _MainProductInfoState();
}

class _MainProductInfoState extends State<MainProductInfo> {
  List productsList = [];
  Map paging = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get() async {
    UserData userData =
    Provider.of<UserData>(context, listen: false);
    var response = await http.get(
      Uri.parse('$serverURL/api/ProductCpanel/List?pageNo=1&pageSize=5'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${userData.userData["access_token"]}'
      },
    );
    print(response.body);
    Map body = jsonDecode(response.body);
    // print(body["Data"]);
    setState(() {
      productsList = body["Data"];
      print(productsList[0]);
      paging = body["Paging"];
    });
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
        productsList = body["Data"];
        paging = body["Paging"];
      });

    }

    deleteProduct(product)async{
      List filter = [];
      UserData userData = Provider.of<UserData>(context , listen: false);
      http.Response response =  await http.post(
        Uri.parse("$serverURL/api/Product/DeleteMainProduct?id=${product["minProduct_Id"]}"),
        headers: <String, String>{
          'Authorization' : 'Bearer ${userData.userData["access_token"]}'
        },
      );
      print(response.body);
      print(response.statusCode);
      if(response.statusCode < 300){
        productsList.forEach((element) {
          if(element["minProduct_Id"] == product["minProduct_Id"]){

          }else{
            filter.add(element);
          }
        });
        setState(() {
          productsList = filter;
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery
          .of(context)
          .size;
      double headerFontSize = size.width > 600 ? 20 : 8;
      double rowFontSize = size.width > 600 ? 20 : 9;
      double productNameSize = size.width > 600 ? 130 : 50;

      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Text("all Main products" , style: TextStyle(color: Colors.black),),
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
                        label: Text('Category',
                          style: TextStyle(
                            fontSize: headerFontSize,
                            fontWeight: FontWeight.bold,), maxLines: 3,)),
                    DataColumn(
                        label: Text('Product Name',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Price',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Arrival',
                                style: TextStyle(
                                    fontSize: headerFontSize,
                                    fontWeight: FontWeight.bold)),
                            Text('State',
                                style: TextStyle(
                                    fontSize: headerFontSize,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )),
                    DataColumn(
                        label: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('best',
                                style: TextStyle(
                                    fontSize: headerFontSize,
                                    fontWeight: FontWeight.bold)),
                            Text('selling',
                                style: TextStyle(
                                    fontSize: headerFontSize,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )),
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('brand',
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
                                    .pushNamed(AddMainProductScreen.routeName);
                              },
                            ),
                          ],
                        ),
                      ),),
                  ],
                  rows: [
                    for(var product in productsList)
                      DataRow(
                          onSelectChanged: (value) {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) =>
                                    SubProductInfo(product["minProduct_Id"])));
                          },
                          cells: [
                            DataCell(Row(
                              children: [
                                InkWell(
                                  hoverColor: Colors.black.withOpacity(0.4),
                                  child: Container(
                                      width: 40,
                                      height: 50,
                                      child: Icon(
                                          Icons.delete_forever_outlined)),
                                  onTap: () => deleteProduct(product),
                                ),
                                Text(product["categoryName"],
                                    style: TextStyle(
                                      fontSize: rowFontSize,
                                    )),
                              ],
                            )),
                            DataCell(Center(
                              child: Container(
                                width: productNameSize,
                                child: Text(product["productName"].toString(),
                                    style: TextStyle(
                                      fontSize: rowFontSize,
                                    )),
                              ),
                            )),
                            DataCell(Text(product["Price"].toString(),
                                style: TextStyle(
                                  fontSize: rowFontSize,
                                ))),
                            DataCell(Text('Actor',
                                style: TextStyle(
                                  fontSize: rowFontSize,
                                ))),
                            DataCell(Text('Actor',
                                style: TextStyle(
                                  fontSize: rowFontSize,
                                ))),
                            DataCell(Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(product["brandName"].toString(),
                                    style: TextStyle(
                                      fontSize: rowFontSize,
                                    )),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) =>
                                            EditMainProductScreen(product)));
                                  },
                                  hoverColor: Colors.black.withOpacity(0.4),
                                  child: Container(
                                    width: 40,
                                    height: 50,
                                    child: Icon(Icons.edit),
                                  ),
                                ),
                              ],
                            )),
                          ]),
                  ],
                ),
              ),
              PaginationWidget(paging["previous"], paging["next"], onClick),
            ],
          ),
        ),
      );
    }
  }