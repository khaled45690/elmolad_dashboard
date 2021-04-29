import 'package:flutter/material.dart';
class MainScreenLowerPart extends StatelessWidget {
  final List data;

  const MainScreenLowerPart(this.data);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double headerFontSize = size.width > 600 ? 20 : 11;
    double rowFontSize = size.width > 600 ? 20 : 12;
    return Container(
      width: size.width - 30,
      child: SingleChildScrollView(
        child: DataTable(
          showCheckboxColumn: false,
          columnSpacing: 20,
          columns: [
            DataColumn(
                label: Text('Order Id',
                    style: TextStyle(
                        fontSize: headerFontSize, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('UserName',
                    style: TextStyle(
                        fontSize: headerFontSize, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Price',
                    style: TextStyle(
                        fontSize: headerFontSize, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Quantity',
                    style: TextStyle(
                        fontSize: headerFontSize, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Total price',
                    style: TextStyle(
                        fontSize: headerFontSize, fontWeight: FontWeight.bold))),
          ],
          rows: [
            for(int i = 0 ; i < data.length ; i++)
            DataRow(cells: [
              DataCell(Text(
                data[i]["orderId"].toString(),
                style: TextStyle(fontSize: rowFontSize),
              )),
              DataCell(Text(
                data[i]["userName"].toString(),
                style: TextStyle(fontSize: rowFontSize),
              )),
              DataCell(Text(
                data[i]["price"].toString(),
                style: TextStyle(fontSize: rowFontSize),
              )),
              DataCell(Text(
                data[i]["productCount"].toString(),
                style: TextStyle(fontSize: rowFontSize),
              )),
              DataCell(Text(
                (data[i]["productCount"] * data[i]["price"]).toString(),
                style: TextStyle(fontSize: rowFontSize),
              )),
            ]),
          ],
        ),
      ),
    );
  }
}
