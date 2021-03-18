import 'package:elmolad_dashboard/Widgets/DropDownWidget.dart';
import 'package:flutter/material.dart';

class AddSubProductTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 110,
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "color",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              DropdownWidget("value", ["value", "values"], 150, 30, (value) {})
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 110,
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "size",
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
