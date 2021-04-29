
import 'package:elmolad_dashboard/ProviderModels/ColorAndSizeImportantInfo.dart';
import 'package:elmolad_dashboard/StateDependentClasses/EditSubProductScreenState.dart';
import 'package:elmolad_dashboard/Widgets/AddSubProductTopPart.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/PhotoViwerWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditSubProductScreen extends StatefulWidget {
  static const String routeName = "/EditSubProduct";
  final Map data;
  EditSubProductScreen(this.data);
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
    print(importantInfo2.colorList);
    importantInfo2.colorList.forEach((element) {
      if (element["colorCode"] == widget.data["color"]) {
        setState(() {
          data["colorValue"] = element["name"];
          data["sizeValue"] = widget.data["size"];
          data["ImgName"] = widget.data["ImgName"];
          data["productId"] = widget.data["id"];
        });
      }
    });
    setState(() {
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
        title: Text(
          "Edit Sub products",
          style: TextStyle(color: Colors.black),
        ),
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
                AddSubProductTopPart(
                    data["colorValue"],
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
                PhotoViwerWidget(data["ImgName"] , espss.deleteProduct),
                SizedBox(
                  height: 30,
                ),
                // ${widget.data["ImgName"]}
                ButtonDesign("Add images", espss.loadAssets),
                SizedBox(
                  height: 30,
                ),
                ButtonDesign("Save", espss.onSubmit),
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
