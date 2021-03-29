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
Map data ={};
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = widget.data;
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
            EditMainProductMiddlePart(data ,importantInfo.brandName , empss.listChange),
            SizedBox(height: 40,),
            ButtonDesign("Save", () {}),
          ],
        ),
      ),
    );
  }
}
