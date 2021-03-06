import 'package:elmolad_dashboard/ProviderModels/CategoryAndBrandImportantInfo.dart';
import 'package:elmolad_dashboard/StateDependentClasses/EditMainProductScreenState.dart';
import 'package:elmolad_dashboard/Widgets/AddMainProductBestSellerWidget.dart';
import 'package:elmolad_dashboard/Widgets/AddMainProductIsWidget.dart';
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
  Map modifiedData = {};
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
    setState(() {
      data = widget.data;

    });
    CategoryAndBrandImportantInfo importantInfo = Provider.of<CategoryAndBrandImportantInfo>(context , listen: false);
    setState(() {
      modifiedData["isAddRecently"] = data["isAddRecently"];
      modifiedData["isDiscount"] = data["isDiscount"];
      modifiedData["isFeatured"] = data["isFeatured"];
      modifiedData["storeid"] = 1;
      brandFilter = importantInfo.brandName;
      categoryValue = data["categoryName"];
      brandValue = data["brandName"];
      importantInfo.categoryMap.forEach((key, value) {
        value.forEach((element) {
          if(widget.data["categorieId"] == element["id"]){
            modifiedData["Gender"] = key;
          }
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
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
            AddMainProductIsWidget(modifiedData , empss.onChange),
            AddMainProductBestSellerWidget(empss.loadAssets , dataError),
            SizedBox(height: 40,),
            ButtonDesign("Save", empss.onSubmitFunc),
          ],
        ),
      ),
    );
  }
}
