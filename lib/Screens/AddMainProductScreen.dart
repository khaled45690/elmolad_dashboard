import 'dart:convert';

import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/CategoryAndBrandImportantInfo.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/StateDependentClasses/AddMainProductScreenState.dart';
import 'package:elmolad_dashboard/Widgets/AddMainProductBestSellerWidget.dart';
import 'package:elmolad_dashboard/Widgets/AddMainProductDropDownPart.dart';
import 'package:elmolad_dashboard/Widgets/AddMainProductIsWidget.dart';
import 'package:elmolad_dashboard/Widgets/AddMainProductMiddlePart.dart';
import 'package:elmolad_dashboard/Widgets/AddMainProductTopPart.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMainProductScreen extends StatefulWidget {
  static const routeName = "/AddMainProductDetailsScreen";

  @override
  _AddMainProductScreenState createState() => _AddMainProductScreenState();
}

class _AddMainProductScreenState extends State<AddMainProductScreen> {
  List<String> brandFilter = [];
  String brandValue = "" , categoryValue = "Top";
  Map data = {
    "productName" : null,
    "Price" : null,
    "minProductDetails":null,
    "Gender":1,
    "categoryId" : "",
    "brandsId":"",
    "ProductOfferPercentage" : "0",
    "isAddRecently":true,
    "isFeatured":false,
    "bestSellerImg":null,
    "isProductOfferPercentage":false,
  };
  Map dataError = {
    "productName" : null,
    "Price" : null,
    "minProductDetails":null,
    "bestSellerImg":null,
  };
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryAndBrandImportantInfo importantInfo = Provider.of<CategoryAndBrandImportantInfo>(context , listen: false);
    // ColorAndSizeImportantInfo importantInfo2 = Provider.of<ColorAndSizeImportantInfo>(context , listen: false);
    // importantInfo2.getInfoFromLocal();
    // importantInfo.getInfoFromLocal();
    if(importantInfo.brandName.isNotEmpty){
      setState(() {
        brandFilter = importantInfo.brandName;
        brandValue = brandFilter[0];
      });
    }else{
      getInfo();
    }

  }

  getInfo()async{
    UserData userdata = Provider.of<UserData>(context , listen: false);

    print(userdata.userData["access_token"]);
    if(userdata.userData["access_token"] == null){
      Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();
      _prefs.then((SharedPreferences prefs) {
        if( prefs.get("userData") == null ){
        } else{
          Map userDataMap = jsonDecode(prefs.getString("userData")!);
          getInfoHttpRequest(userDataMap["access_token"]);
        }
      });
    }else{
      getInfoHttpRequest(userdata.userData["access_token"]);
    }

  }

  getInfoHttpRequest(accessToken)async{
    CategoryAndBrandImportantInfo importantInfo = Provider.of<CategoryAndBrandImportantInfo>(context , listen: false);
    List<String> arr = [];
    var response = await http.get(
      Uri.parse('$serverURL/api/Brands/list'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer $accessToken'
      },
    );
    print(response.body);
    if(response.statusCode < 300){
      importantInfo.brandList = jsonDecode(response.body);
      importantInfo.brandList.forEach((element) {
        arr.add(element["brandName"]);
      });
      importantInfo.brandName = arr;
      setState(() {
        brandFilter = importantInfo.brandName;
        brandValue = brandFilter[0];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    CategoryAndBrandImportantInfo importantInfo = Provider.of<CategoryAndBrandImportantInfo>(context);
    AddMainProductScreenState ampss = AddMainProductScreenState(this);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Add Main Product" , style: TextStyle(color: Colors.black),),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AddMainProductTopPart(data["Gender"] , ampss.onChange),
            SizedBox(
              height: 30,
            ),
            AddMainProductMiddlePart(dataError , ampss.onChange),
            AddMainProductDropDownPart(brandFilter , brandValue  , categoryValue , importantInfo.categoryNameList , ampss.dropDownTextChange , ampss.searchFunction , ampss.categoryListChange),
            AddMainProductIsWidget(data , ampss.onChange),
            AddMainProductBestSellerWidget(ampss.loadAssets , dataError),
            SizedBox(
              height: 30,
            ),
            ButtonDesign("Next", ampss.onSubmitFunc),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
