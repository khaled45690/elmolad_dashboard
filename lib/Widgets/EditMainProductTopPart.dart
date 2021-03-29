import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class EditMainProductTopPart extends StatelessWidget {
  final Map data;
  final Function onchange;
  const EditMainProductTopPart(this.data , this.onchange);
  @override
  Widget build(BuildContext context) {

    print(data);
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
                    "Name",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                    width: screenSize - 200,
                    child: CustomTextField(data["productName"], null, (value) {onchange(value , "productName");})),
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
                    child: CustomTextField(data["Price"].toString(), null, (value) {onchange(value , "Price");})),
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
          ],
        ),
      ),
    );
  }
}
