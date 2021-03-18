import 'package:elmolad_dashboard/Screens/AddRoomScreen.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/PaginationWidget.dart';
import 'package:flutter/material.dart';

class RoomListScreen extends StatefulWidget {
  static const String routeName = "/BrandListScreen";
  @override
  _RoomListScreenState createState() => _RoomListScreenState();
}

class _RoomListScreenState extends State<RoomListScreen> {
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
                      label: Text('Brand name',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Image ',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold)),
                        InkWell(
                          child: Icon(Icons.add_circle_rounded),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AddRoomScreen.routeName);
                          },
                        ),
                      ],
                    ),
                  )),
                ],
                rows: [
                  DataRow(
                      cells: [
                    DataCell(
                        Row(
                      children: [
                        InkWell(
                          child: Icon(Icons.delete_forever_outlined),
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
