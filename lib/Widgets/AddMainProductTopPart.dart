import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:flutter/material.dart';

class AddMainProductTopPart extends StatelessWidget {
  final int? i;
  final Function func;

  const AddMainProductTopPart(this.i, this.func);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ButtonDesign("Men", () => func(1 , "Gender") , changeColor: i == 1 ? " " : null,),
        ButtonDesign("Women", () => func(2 , "Gender"), changeColor: i == 2 ? " " : null,),
        // ButtonDesign("Children", () {func(3 , "Gender");} , changeColor: i == 3 ? " " : null,),
      ],
    );
  }
}
