import 'package:flutter/material.dart';

class AddMainProductIsWidget extends StatelessWidget {
  final Map data;
  final Function onChange;

  const AddMainProductIsWidget(this.data , this.onChange);
  @override
  Widget build(BuildContext context) {
    return Column(
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
              value: data["isAddRecently"],
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
              value: data["isFeatured"],
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
              value: data["isProductOfferPercentage"],
              activeColor: Colors.lightBlueAccent,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
