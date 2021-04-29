import 'dart:convert';
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/CategoryAndBrandImportantInfo.dart';
import 'package:elmolad_dashboard/ProviderModels/ColorAndSizeImportantInfo.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/MainScreenLowerPart.dart';
import 'package:elmolad_dashboard/Widgets/MainScreenUpperPart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/MainScreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Map info = {};
  List data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryAndBrandImportantInfo importantInfo =
        Provider.of<CategoryAndBrandImportantInfo>(context, listen: false);
    ColorAndSizeImportantInfo importantInfo2 =
        Provider.of<ColorAndSizeImportantInfo>(context, listen: false);
    UserData userData = Provider.of<UserData>(context, listen: false);
    // importantInfo2.getInfoFromLocal();
    // importantInfo.getInfoFromLocal();
    importantInfo.getInfo(userData.userData["access_token"]);
    importantInfo2.getInfo(userData.userData["access_token"]);
    get();
  }

  void get() async {
    UserData userData = Provider.of<UserData>(context, listen: false);
    var response = await http.get(
      Uri.parse('$serverURL/api/Home/Info'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${userData.userData["access_token"]}",
      },
    );

    // print(response.body);
    if (response.statusCode < 300) {
      setState(() {
        info = jsonDecode(response.body);
      });
    }

    var response2 = await http.get(
      Uri.parse('$serverURL/api/OrderCpanel/List?pageNo=1&pageSize=10'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${userData.userData["access_token"]}",
      },
    );
    Map body = jsonDecode(response2.body);
    if (response2.statusCode < 300) {
      setState(() {
        data = body["Data"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerWidget(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainScreenUpperPart(info),
              SizedBox(
                height: 30,
              ),
              Text(
                "Last 10 Orders",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    letterSpacing: 5),
              ),
              SizedBox(
                height: 30,
              ),
              MainScreenLowerPart(data),
            ],
          ),
        ),
      ),
    );
  }
}
