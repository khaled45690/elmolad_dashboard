import 'package:elmolad_dashboard/Screens/AddSubProductsScreen.dart';
import 'package:elmolad_dashboard/Screens/EditSubProductScreen.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/PaginationWidget.dart';
import 'package:flutter/material.dart';

class SubProductInfo extends StatefulWidget {
  static const String routeName = "/SubProductInfo";
  @override
  _SubProductInfoState createState() => _SubProductInfoState();
}

class _SubProductInfoState extends State<SubProductInfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double headerFontSize = size.width > 600 ? 20 : 11;
    double rowFontSize = size.width > 600 ? 20 : 12;
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
          children: [
            Container(
              width: size.width,
              height: size.height - 150,
              child: DataTable(
                showCheckboxColumn: false,
                columnSpacing: 30,
                columns: [
                  DataColumn(
                      label: Text('Color',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Size',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('brand',
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
                                  .pushNamed(AddSubProductsScreen.routeName);
                            },
                          ),
                        ],
                      ),
                    ),),
                ],
                rows: [
                  DataRow(
                      cells: [
                        DataCell(Row(
                          children: [
                            InkWell(
                              hoverColor: Colors.black.withOpacity(0.4),
                              child: Container(
                                  width: 40,
                                  height: 50,
                                  child: Icon(Icons.delete_forever_outlined)),
                              onTap: () {
                                print("hi");
                              },
                            ),
                            Text('Red',
                                style: TextStyle(
                                  fontSize: rowFontSize,
                                )),
                          ],
                        )),
                        DataCell(Text('XL',
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                        DataCell(Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('image',
                                style: TextStyle(
                                  fontSize: rowFontSize,
                                )),
                            InkWell(
                              onTap: () {
                               Navigator.of(context).pushNamed(EditSubProductScreen.routeName);
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
                      ],),
                ],
              ),
            ),
            PaginationWidget("" , "" , (){}),
          ],
        ),
      ),
    );
  }
}
