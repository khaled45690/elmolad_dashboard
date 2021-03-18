import 'package:elmolad_dashboard/Screens/OrderDetailsScreen.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/PaginationWidget.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = "/OrdersScreen";
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
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
                columnSpacing: 25,
                columns: [
                  DataColumn(
                      label: Text('Client',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Store ',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Date',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Total price',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                ],
                rows: [
                  DataRow(
                      onSelectChanged: (value) {
                        Navigator.of(context)
                            .pushNamed(OrderDetailsScreen.routeName);
                      },
                      cells: [
                        DataCell(Text('1',
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                        DataCell(Text('Stephen',
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                        DataCell(Text('Actor',
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                        DataCell(Text('Actor',
                            style: TextStyle(
                              fontSize: rowFontSize,
                            ))),
                      ]),
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('Stephen')),
                    DataCell(Text('Actor')),
                    DataCell(Text('Actor')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('Stephen')),
                    DataCell(Text('Actor')),
                    DataCell(Text('Actor')),
                  ]),
                  DataRow(
                      onSelectChanged: (value) {
                        print(value);
                      },
                      cells: [
                        DataCell(Text('1')),
                        DataCell(Text('Stephen')),
                        DataCell(Text('Actor')),
                        DataCell(Text('Actor')),
                      ]),
                  DataRow(
                      onSelectChanged: (value) {
                        print(value);
                      },
                      cells: [
                        DataCell(Text('1')),
                        DataCell(Text('Stephen')),
                        DataCell(Text('Actor')),
                        DataCell(Text('Actor')),
                      ]),
                  DataRow(
                      onSelectChanged: (value) {
                        print(value);
                      },
                      cells: [
                        DataCell(Text('1')),
                        DataCell(Text('Stephen')),
                        DataCell(Text('Actor')),
                        DataCell(Text('Actor')),
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
