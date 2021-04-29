import 'package:flutter/material.dart';

class AddMainProductIsWidget extends StatelessWidget {
  final Map data;
  final Function onChange;

  const AddMainProductIsWidget(this.data , this.onChange);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenSize = size.width > 700 ? 700 : size.width;
    return Container(
      width: screenSize / 1.05,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10,),
              Container(
                width: 250,
                child: Text(
                  'is it Added Recently',
                  style: TextStyle(fontSize: 20, color: Colors.black , fontWeight: FontWeight.w600),
                ),
              ),
              Checkbox(
                onChanged: (value) => onChange(value , "isAddRecently"),
                value: data["isAddRecently"] == null ? false : data["isAddRecently"],
                activeColor: Colors.lightBlueAccent,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10,),
              Container(
                width: 250,
                child: Text(
                  'is it Featured',
                  style: TextStyle(fontSize: 20, color: Colors.black , fontWeight: FontWeight.w600),
                ),
              ),
              Checkbox(
                onChanged: (value) =>onChange(value , "isFeatured"),
                value: data["isFeatured"] == null ? false : data["isFeatured"],
                activeColor: Colors.lightBlueAccent,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10,),
              Container(
                width: 250,
                child: Text(
                  'is there Offer Percentage',
                  style: TextStyle(fontSize: 20, color: Colors.black , fontWeight: FontWeight.w600),
                ),
              ),
              Checkbox(
                onChanged: (value) =>onChange(value , "isProductOfferPercentage"),
                value: data["isProductOfferPercentage"] == null ? false :  data["isProductOfferPercentage"],
                activeColor: Colors.lightBlueAccent,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
