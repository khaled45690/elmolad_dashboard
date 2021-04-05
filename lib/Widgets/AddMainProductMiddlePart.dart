import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class AddMainProductMiddlePart extends StatelessWidget {
  final Map dataError;
  final Function onChange ;
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
                  "Product Name",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                  width: screenSize - 200,
                  child: CustomTextField("Product Name", dataError["minProductName"], (value) {
                    onChange(value, "minProductName");
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
                  child: CustomTextField("Price", dataError["productPrice"], (value) {
                    onChange(value, "productPrice");
                  })),
            ],
          ),
          Row(
            children: [
              Container(
                width: 110,
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "Offer Percentage",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                  width: screenSize - 200,
                  child: CustomTextField("Offer Percentage", dataError["productOfferPercentage"], (value) {
                    onChange(value, "productOfferPercentage");
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                  width: screenSize - 200,
                  child: CustomTextField(
                    "Description",
                    dataError["minProductDetails"],
                    (value) {
                      onChange(value, "minProductDetails");
                    },
                    maxLines: 4,
                  )),
            ],
          ),
          // val
        ],
      ),
    );
  }
}
