import 'package:flutter/material.dart';

class OrderDetailsLowerPart extends StatelessWidget {
  final List orderProductList;

  const OrderDetailsLowerPart(this.orderProductList);

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
          for(int i = 0; i < orderProductList.length ; i++)
          DataRow(cells: [
            DataCell(Text(
              orderProductList[i]["minProductName"],
              style: TextStyle(fontSize: rowFontSize),
            )),
            DataCell(Text(
              orderProductList[i]["quantity"].toString(),
              style: TextStyle(fontSize: rowFontSize),
            )),
            DataCell(Text(
              orderProductList[i]["orderProductPrice"].toString(),
              style: TextStyle(fontSize: rowFontSize),
            )),
            DataCell(Text(
              orderProductList[i]["total"].toString(),
              style: TextStyle(fontSize: rowFontSize),
            )),
          ]),
        ],
      ),
    );
  }
}
