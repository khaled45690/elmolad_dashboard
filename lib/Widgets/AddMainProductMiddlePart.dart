import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:elmolad_dashboard/Widgets/DropDownWidget.dart';
import 'package:flutter/material.dart';

class AddMainProductMiddlePart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenSize = size.width > 700 ? 700 : size.width;
    return Container(
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
                  "Name",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                  width: screenSize - 200,
                  child: CustomTextField("Name", null, (value) {})),
            ],
          ),
          Row(
            children: [
              Container(
                width: 110,
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "price",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                  width: screenSize - 200,
                  child: CustomTextField("price", null, (value) {})),
            ],
          ),
          Row(
            children: [
              Container(
                width: 110,
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "description",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                  width: screenSize - 200,
                  child: CustomTextField(
                    "description",
                    null,
                    (value) {},
                    maxLines: 4,
                  )),
            ],
          ),
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
              DropdownWidget("value", ["value", "values"], 150, 30, (value) {})
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
              DropdownWidget("value", ["value", "values"], 150, 30, (value) {})
            ],
          ),
        ],
      ),
    );
  }
}
