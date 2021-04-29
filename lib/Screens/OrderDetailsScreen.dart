import 'dart:convert';

import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/OrderDetailsLowerPart.dart';
import 'package:elmolad_dashboard/Widgets/OrderDetailsUpperPart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const routeName = "/OrderDetails";
  final int orderId;
  OrderDetailsScreen(this.orderId);
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  Map order = {};
  List orderProductList = [];
  List keys = [];
  List values = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()async{
    UserData userData = Provider.of<UserData>(context , listen: false);
    var response = await http.get(
      Uri.parse("$serverURL/api/OrderCpanel/details?orderId=${widget.orderId}"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authentication' : 'Bearer ${userData.userData["access_token"]}'
      },
    );

    print(response.body);
    Map body = jsonDecode(response.body);
    setState(() {
      order = body["Order"];
      orderProductList =  body["orderProdactList"];
      order.forEach((key, value) {
        keys.add(key);
        values.add(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.orderId);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Order details" , style: TextStyle(color: Colors.black),),
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
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              OrderDetailsUpperPart(keys , values),
              OrderDetailsLowerPart(orderProductList),
            ],
          ),
        ),
      ),
    );
  }

}
