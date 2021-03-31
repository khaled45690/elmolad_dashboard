import 'package:elmolad_dashboard/ProviderModels/ColorAndSizeImportantInfo.dart';
import 'package:elmolad_dashboard/StateDependentClasses/EditSubProductScreenState.dart';
import 'package:elmolad_dashboard/Widgets/AddSubProductTopPart.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditSubProductScreen extends StatefulWidget {
  static const String routeName = "/EditSubProduct";
  @override
  _EditSubProductScreenState createState() => _EditSubProductScreenState();
}

class _EditSubProductScreenState extends State<EditSubProductScreen> {
  List<String> colorListFilter = [], sizeListFilter = [];
  Map data = {
    "colorValue": "",
    "sizeValue": "",
    "imagesList": [],
  };

  bool isDone = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ColorAndSizeImportantInfo importantInfo2 =
    Provider.of<ColorAndSizeImportantInfo>(context, listen: false);
    setState(() {
      data["colorValue"] = importantInfo2.colorName[0];
      data["sizeValue"] = importantInfo2.sizeName[0];
      colorListFilter = importantInfo2.colorName;
      sizeListFilter = importantInfo2.sizeName;
    });
  }


  @override
  Widget build(BuildContext context) {
    EditSubProductScreenState espss = new EditSubProductScreenState(this);
    // ☺️
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Edit Sub products" , style: TextStyle(color: Colors.black),),
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
        child: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1, //                   <--- border width here
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AddSubProductTopPart( data["colorValue"],
                data["sizeValue"],
                colorListFilter,
                sizeListFilter,
                espss.colorChange,
                espss.sizeChange,
                espss.colorSearchFunction,
                espss.sizeSearchFunction),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonDesign("Add images", (){}),
                SizedBox(
                  height: 30,
                ),
                ButtonDesign("Save", () {}),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
