import 'package:flutter/material.dart';

class UserDetailsLowerPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double headerFontSize = size.width > 600 ? 20 : 11;
    double rowFontSize = size.width > 600 ? 20 : 12;
    return Container(
      width: size.width - 30,
      child: DataTable(
        showCheckboxColumn: false,
        columnSpacing: 20,
        columns: [
          DataColumn(
              label: Text('Product',
                  style: TextStyle(
                      fontSize: headerFontSize, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Quantity',
                  style: TextStyle(
                      fontSize: headerFontSize, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('price',
                  style: TextStyle(
                      fontSize: headerFontSize, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Total price',
                  style: TextStyle(
                      fontSize: headerFontSize, fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text(
              '1',
              style: TextStyle(fontSize: rowFontSize),
            )),
            DataCell(Text(
              'Stephen',
              style: TextStyle(fontSize: rowFontSize),
            )),
            DataCell(Text(
              'Actor',
              style: TextStyle(fontSize: rowFontSize),
            )),
            DataCell(Text(
              'Actor',
              style: TextStyle(fontSize: rowFontSize),
            )),
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
    );
  }
}
