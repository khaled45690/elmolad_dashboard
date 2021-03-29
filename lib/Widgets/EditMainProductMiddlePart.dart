import 'package:elmolad_dashboard/Widgets/DropDownWidget.dart';
import 'package:flutter/material.dart';

class EditMainProductMiddlePart extends StatelessWidget {
  final Map data;
  final List<String> brandName;
  final Function listChange;
  const EditMainProductMiddlePart( this.data ,this.brandName , this.listChange);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenSize = size.width > 700 ? 700 : size.width - 30;
    return Center(
      child: Container(
        width: screenSize / 1.05,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Row(
              children: [
                Container(
                  width: 110,
                  margin: EdgeInsets.only(right: 30),
                  child: Text(
                    "Category",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
                DropdownWidget(brandName[0], brandName, 150, 30, (value) {listChange(value , "dad");})
              ],
            ),
            Row(
              children: [
                Container(
                  width: 110,
                  margin: EdgeInsets.only(right: 30),
                  child: Text(
                    "brand",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
                 // ExpandedDropDown(brandValue, brandName , (value){} ,(value){}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
