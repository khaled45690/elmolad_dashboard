import 'package:elmolad_dashboard/Screens/AddSizeScreen.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/PaginationWidget.dart';
import 'package:flutter/material.dart';

class ShowSizesScreen extends StatefulWidget {
  static const String routeName = "/ShowSizes";
  @override
  _ShowSizesScreenState createState() => _ShowSizesScreenState();
}

class _ShowSizesScreenState extends State<ShowSizesScreen> {

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
                      label: Text('Id',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Size name',
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
                                  .pushNamed(AddSizeScreen.routeName);
                            },
                          ),
                        ],
                      ),
                    ),),
                ],
                rows: [
                  DataRow(
                      cells: [
                        DataCell(

                            Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                            Text('1',
                                style: TextStyle(
                                  fontSize: rowFontSize,
                                )),
                          ],
                        )),
                        DataCell(Text('Xl',
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                      ]),
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
