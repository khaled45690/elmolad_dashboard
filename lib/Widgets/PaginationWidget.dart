import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:flutter/material.dart';

class PaginationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonDesign("previous", () {}),
        SizedBox(
          width: 25,
        ),
        ButtonDesign("next", () {}),
      ],
    );
  }
}
