import 'package:elmolad_dashboard/Screens/AddMainProductScreen.dart';
import 'package:elmolad_dashboard/Screens/EditMainProductScreen.dart';
import 'package:elmolad_dashboard/Screens/SubProductInfo.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/PaginationWidget.dart';
import 'package:flutter/material.dart';

class MainProductInfo extends StatefulWidget {
  static const String routeName = "/MainProductInfo";
  @override
  _MainProductInfoState createState() => _MainProductInfoState();
}

class _MainProductInfoState extends State<MainProductInfo> {
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
                      label: Text('Name',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('price',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('category',
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
                                .pushNamed(AddMainProductScreen.routeName);
                          },
                        ),
                      ],
                    ),
                  )),
                ],
                rows: [
                  DataRow(
                      onSelectChanged: (value) {
                        Navigator.of(context)
                            .pushNamed(SubProductInfo.routeName);
                      },
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
                            Text('Stephen',
                                style: TextStyle(
                                  fontSize: rowFontSize,
                                )),
                          ],
                        )),
                        DataCell(Text('Actor',
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                        DataCell(Text('Actor',
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                        DataCell(Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Actor',
                                style: TextStyle(
                                  fontSize: rowFontSize,
                                )),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(EditMainProductScreen.routeName);
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
            PaginationWidget(),
          ],
        ),
      ),
    );
  }
}
