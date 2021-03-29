import 'package:elmolad_dashboard/Screens/UserDetailScreen.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/PaginationWidget.dart';
import 'package:flutter/material.dart';

class UsersListScreen extends StatefulWidget {
  static const String routeName = "/UsersListScreen";
  @override
  _UsersListScreenState createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double headerFontSize = size.width > 600 ? 20 : 12;
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
                      label: Text('User Name',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Email',
                          style: TextStyle(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Address',
                            style: TextStyle(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold)),
                        // InkWell(child: Icon(Icons.add_circle_rounded), onTap: (){Navigator.of(context).pushNamed(AddStoreScreen.routeName);},),
                      ],
                    ),
                  )),
                ],
                rows: [
                  DataRow(
                      onSelectChanged: (value) {
                        Navigator.of(context)
                            .pushNamed(UserDetailsScreen.routeName);
                      },
                      cells: [
                        DataCell(Row(
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
                        DataCell(Text(
                          'Actsdfsdu fhwehufwkj fhwkej fhwjkfhw jkfhwej khfwjkhfor',
                          style: TextStyle(
                            fontSize: rowFontSize,
                          ),
                          maxLines: 3,
                        )),
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
