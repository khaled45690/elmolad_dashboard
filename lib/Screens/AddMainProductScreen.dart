import 'package:elmolad_dashboard/ProviderModels/CategoryAndBrandImportantInfo.dart';
import 'package:elmolad_dashboard/ProviderModels/ColorAndSizeImportantInfo.dart';
import 'package:elmolad_dashboard/StateDependentClasses/AddMainProductScreenState.dart';
import 'package:elmolad_dashboard/Widgets/AddMainProductDropDownPart.dart';
import 'package:elmolad_dashboard/Widgets/AddMainProductMiddlePart.dart';
import 'package:elmolad_dashboard/Widgets/AddMainProductTopPart.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMainProductScreen extends StatefulWidget {
  static const routeName = "/AddMainProductDetailsScreen";

  @override
  _AddMainProductScreenState createState() => _AddMainProductScreenState();
}

class _AddMainProductScreenState extends State<AddMainProductScreen> {
  List<String> brandFilter = [];
  String brandValue = "" , categoryValue = "Top";
  Map data = {
    "minProductName" : null,
    "productPrice" : null,
    "minProductDetails":null,
    "Gender":1,
    "categoryId" : "",
    "brandsId":"",
  };
  Map dataError = {
    "minProductName" : null,
    "productPrice" : null,
    "minProductDetails":null,
  };
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryAndBrandImportantInfo importantInfo = Provider.of<CategoryAndBrandImportantInfo>(context , listen: false);
    ColorAndSizeImportantInfo importantInfo2 = Provider.of<ColorAndSizeImportantInfo>(context , listen: false);
    importantInfo2.getInfoFromLocal();
    importantInfo.getInfoFromLocal();
    setState(() {
        brandFilter = importantInfo.brandName;
        brandValue = brandFilter[0];
    });
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
