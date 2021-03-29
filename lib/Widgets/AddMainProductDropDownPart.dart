import 'package:elmolad_dashboard/Widgets/DropDownWidget.dart';
import 'package:elmolad_dashboard/Widgets/ExpandedDropDown.dart';
import 'package:flutter/material.dart';

class AddMainProductDropDownPart extends StatelessWidget {
  final List<String> brandNames , categoryNames;
  final Function searchFunction , dropDownTextChange , categoryChangeFunction;
  final String brandValue , categoryValue;
  const AddMainProductDropDownPart(this.brandNames , this.brandValue, this.categoryValue, this.categoryNames ,this.dropDownTextChange ,this.searchFunction , this.categoryChangeFunction);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenSize = size.width > 700 ? 700 : size.width;
    return Container(
      width: screenSize / 1.05,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // val
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
              DropdownWidget(categoryValue, categoryNames, 150, 30, categoryChangeFunction)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 110,
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "brand",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              ExpandedDropDown(brandValue, brandNames , dropDownTextChange ,searchFunction),
              // DropdownWidget(value, brandNames, 150, 30, (value) {},searchFunction),
            ],
          ),
          SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}
