import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:flutter/material.dart';

class AddMainProductTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ButtonDesign("Men", () {}),
        ButtonDesign("Women", () {}),
        ButtonDesign("Children", () {}),
      ],
    );
  }
}
