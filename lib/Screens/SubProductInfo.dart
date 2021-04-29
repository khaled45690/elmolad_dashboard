import 'dart:convert';

import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Screens/AddSubProductsScreen.dart';
import 'package:elmolad_dashboard/Screens/EditSubProductScreen.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/PaginationWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SubProductInfo extends StatefulWidget {
  static const String routeName = "/SubProductInfo";
  final int minProductId;
  SubProductInfo(this.minProductId);
  @override
  _SubProductInfoState createState() => _SubProductInfoState();
}

class _SubProductInfoState extends State<SubProductInfo> {
  List data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData()async{
    UserData userData = Provider.of<UserData>(context , listen: false);
    print('widget.minProductId');
    print(widget.minProductId);
    print('$serverURL/api/ProductCpanelById/List?id=${widget.minProductId}');
    http.Response response = await http.get(
        Uri.parse('$serverURL/api/ProductCpanelById/List?id=${widget.minProductId}'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization' : 'Bearer ${userData.userData["access_token"]}'
        },
      );
     print(jsonDecode(response.body));
     setState(() {
       data = jsonDecode(response.body);
     });

  }

  deleteProduct(product)async{
    UserData userData = Provider.of<UserData>(context , listen: false);
    List filter = [];
    http.Response response =  await http.post(
      Uri.parse("$serverURL/api/Product/DeleteProduct?id=${product["id"]}") ,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer ${userData.userData["access_token"]}'
      },
    );
    print(response.body);
    print(response.statusCode);
    if(response.statusCode < 300){
      data.forEach((element) {
        if(element["id"] == product["id"]){

        }else{
          filter.add(element);
        }
      });
      setState(() {
        data = filter;
      });
    }
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
        title: Text("sub products" , style: TextStyle(color: Colors.black),),
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
                      label: Text('Color',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Size',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
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
                                  .pushNamed(AddSubProductsScreen.routeName);
                            },
                          ),
                        ],
                      ),
                    ),),
                ],
                rows: [
                  for(int i = 0; i < data.length ; i++)
                  DataRow(
                      cells: [
                        DataCell(Row(
                          children: [
                            InkWell(
                              hoverColor: Colors.black.withOpacity(0.4),
                              child: Container(
                                  width: 40,
                                  height: 50,
                                  child: Icon(Icons.delete_forever_outlined)),
                              onTap: () => deleteProduct(data[i]),
                            ),
                            Container(
                              width: 30,
                              height: 40,
                              color: Color(int.parse("0xFF${data[i]["color"].substring(1)}")),
                            ),
                          ],
                        )),
                        DataCell(Text(data[i]["size"],
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                        DataCell(Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network("$serverURL/img/products/${data[i]["ImgName"][0]}", width: 50, height: 30,),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                               Navigator.of(context).push(
                                   MaterialPageRoute(builder: (context) =>
                                       EditSubProductScreen(data[i])));
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
                      ],),
                ],
              ),
            ),
            PaginationWidget("" , "" , (){}),
          ],
        ),
      ),
    );
  }
}
