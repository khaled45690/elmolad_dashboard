import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:flutter/material.dart';

class AddMainProductBestSellerWidget extends StatelessWidget {
  final Function uploadImageFunction;

  const AddMainProductBestSellerWidget(this.uploadImageFunction);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text("upload best seller image" , style: TextStyle(fontWeight: FontWeight.w700 , fontSize: 18  ),)),
        ButtonDesign("upload image", (){}),
      ],
    );
  }
}
