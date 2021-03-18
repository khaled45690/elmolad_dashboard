import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:elmolad_dashboard/Widgets/DropDownWidget.dart';
import 'package:flutter/material.dart';

class AddMainProductMiddlePart extends StatelessWidget {
  final Map dataError;
  final Function onChange;

  const AddMainProductMiddlePart(this.dataError, this.onChange);
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
                  child: CustomTextField("Name", dataError["Name"], (value) {
                    onChange(value, "Name");
                  })),
            ],
          ),
          Row(
            children: [
              Container(
                width: 110,
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "Price",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                  width: screenSize - 200,
                  child: CustomTextField("Price", dataError["Price"], (value) {
                    onChange(value, "Price");
                  })),
            ],
          ),
          Row(
            children: [
              Container(
                width: 112,
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                  width: screenSize - 200,
                  child: CustomTextField(
                    "Description",
                    dataError["Description"],
                    (value) {
                      onChange(value, "Description");
                    },
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
              DropdownWidget("value", ["value", "values"], 150, 30, (value) {}),
            ],
          ),
        ],
      ),
    );
  }
}
