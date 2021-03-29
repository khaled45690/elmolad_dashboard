import 'package:elmolad_dashboard/ProviderModels/ColorAndSizeImportantInfo.dart';
import 'package:elmolad_dashboard/StateDependentClasses/AddSubProductScreenState.dart';
import 'package:elmolad_dashboard/Widgets/AddSubProductTopPart.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddSubProductScreen extends StatefulWidget {

 final String minProductId;
  AddSubProductScreen(this.minProductId);

  @override
  _AddSubProductScreenState createState() => _AddSubProductScreenState();
}

class _AddSubProductScreenState extends State<AddSubProductScreen> {
  List<String> colorListFilter = [], sizeListFilter = [];
  Map data = {
    "colorValue": "",
    "sizeValue": "",
    "imagesList" : [],
  };
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
    AddSubProductScreenState aspss = new AddSubProductScreenState(this);
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          width: 400,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(""),
              AddSubProductTopPart(data["colorValue"], data["sizeValue"],
                  colorListFilter, sizeListFilter, aspss.colorChange, aspss.sizeChange ,aspss.colorSearchFunction , aspss.sizeSearchFunction),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
              ),
              ButtonDesign("Select images", aspss.loadAssets),
              SizedBox(
                height: 30,
              ),
              ButtonDesign("Submit", aspss.onSubmit),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
