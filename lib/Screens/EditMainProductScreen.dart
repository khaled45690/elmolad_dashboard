import 'package:elmolad_dashboard/ProviderModels/CategoryAndBrandImportantInfo.dart';
import 'package:elmolad_dashboard/StateDependentClasses/EditMainProductScreenState.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/EditMainProductMiddlePart.dart';
import 'package:elmolad_dashboard/Widgets/EditMainProductTopPart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditMainProductScreen extends StatefulWidget {
  final Map data;
  static const String routeName = "/EditMainProduct";

  const EditMainProductScreen(this.data);
  @override
  _EditMainProductScreenState createState() => _EditMainProductScreenState();
}

class _EditMainProductScreenState extends State<EditMainProductScreen> {
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
    data = widget.data;
    CategoryAndBrandImportantInfo importantInfo = Provider.of<CategoryAndBrandImportantInfo>(context , listen: false);
    setState(() {
      brandFilter = importantInfo.brandName;
      brandValue = brandFilter[0];
      categoryValue = data["categorieId"];
    });
  }
  @override
  Widget build(BuildContext context) {
  print(widget.data);
    EditMainProductScreenState empss = new EditMainProductScreenState(this);
    CategoryAndBrandImportantInfo importantInfo = Provider.of<CategoryAndBrandImportantInfo>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Edit Main products" , style: TextStyle(color: Colors.black),),
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
            EditMainProductTopPart(widget.data , empss.onChange),
            EditMainProductMiddlePart(brandFilter , brandValue  , categoryValue , importantInfo.categoryNameList , empss.dropDownTextChange , empss.searchFunction , empss.categoryListChange),
            SizedBox(height: 40,),
            ButtonDesign("Save", () {}),
          ],
        ),
      ),
    );
  }
}
