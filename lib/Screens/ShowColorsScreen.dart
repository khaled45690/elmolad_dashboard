import 'package:elmolad_dashboard/ProviderModels/ColorAndSizeImportantInfo.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Screens/ColorPickerScreen.dart';
import 'package:elmolad_dashboard/Screens/EditColorScreen.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowColorsScreen extends StatefulWidget {
  static const String routeName = "/ShowColors";
  @override
  _ShowColorsScreenState createState() => _ShowColorsScreenState();
}

class _ShowColorsScreenState extends State<ShowColorsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ColorAndSizeImportantInfo importantInfo =
    Provider.of<ColorAndSizeImportantInfo>(context , listen: false);
    UserData userData = Provider.of<UserData>(context , listen: false);
    importantInfo.getInfo(userData.userData["access_token"]);
  }
  @override
  Widget build(BuildContext context) {
    ColorAndSizeImportantInfo importantInfo =
        Provider.of<ColorAndSizeImportantInfo>(context);
    Size size = MediaQuery.of(context).size;
    double headerFontSize = size.width > 600 ? 20 : 11;
    double rowFontSize = size.width > 600 ? 20 : 12;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("colors" , style: TextStyle(color: Colors.black),),
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
          children: [
            Container(
              width: size.width,
              height: size.height - 150,
              child: SingleChildScrollView(
                child: DataTable(
                  showCheckboxColumn: false,
                  columnSpacing: 30,
                  columns: [
                    DataColumn(
                        label: Text('Id',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Id',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold))),
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Color',
                                style: TextStyle(
                                    fontSize: headerFontSize,
                                    fontWeight: FontWeight.bold)),
                            InkWell(
                              hoverColor: Colors.black.withOpacity(0.4),
                              child: Container(
                                  width: 40,
                                  height: 50,
                                  child: Icon(Icons.add_circle_rounded)),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(ColorPickerScreen.routeName);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    for (int i = 0; i < importantInfo.colorList.length; i++)
                      DataRow(cells: [
                        DataCell(Text(importantInfo.colorList[i]["id"].toString(),
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                        DataCell(Text(importantInfo.colorList[i]["name"],
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                        DataCell(Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 30,
                              height: 40,
                              color: Color(int.parse("0xFF${importantInfo.colorList[i]["colorCode"].substring(1)}")),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) =>
                                        EditColorScreen(importantInfo.colorList[i])));
                              },
                              hoverColor: Colors.black.withOpacity(0.4),
                              child: Container(
                                width: 40,
                                height: 50,
                                child: Icon(Icons.edit),
                              ),
                            ),
                          ],
                        )),
                      ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
