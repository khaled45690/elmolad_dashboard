import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:flutter/material.dart';

class AddMainProductBestSellerWidget extends StatelessWidget {
  final Function uploadImageFunction;
  final Map dataError;

  const AddMainProductBestSellerWidget(this.uploadImageFunction , this.dataError);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenSize = size.width > 700 ? 700 : size.width;
    return Container(
      width: screenSize / 1.05,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 240,
                  child: Text("upload best seller image" , style: TextStyle(fontWeight: FontWeight.w700 , fontSize: 18  ),)),
              ButtonDesign("upload image", uploadImageFunction),
            ],
          ),
          dataError["bestSellerImg"] == null ? Container() : Text(dataError["bestSellerImg"] , style: TextStyle(color: Colors.red),),
        ],
      ),
    );
  }
}
