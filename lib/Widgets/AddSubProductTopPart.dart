import 'package:elmolad_dashboard/Widgets/ExpandedDropDown.dart';
import 'package:flutter/material.dart';

class AddSubProductTopPart extends StatelessWidget {
  final String colorValue , sizeValue;
  final List<String> colorList, sizeList;
  final Function colorChange , sizeChange , colorFilter , sizeFilter;

  const AddSubProductTopPart(this.colorValue, this.sizeValue , this.colorList , this.sizeList , this.colorChange , this.sizeChange , this.colorFilter , this.sizeFilter);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
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
                  "color",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              ExpandedDropDown(colorValue, colorList, colorChange ,colorFilter),
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
                  "size",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              ExpandedDropDown(sizeValue, sizeList , sizeChange ,sizeFilter),
            ],
          ),
        ],
      ),
    );
  }
}
