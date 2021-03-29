import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:flutter/material.dart';

class PaginationWidget extends StatelessWidget {
  final  previous, next;
  final Function onClick;


  const PaginationWidget(this.previous, this.next , this.onClick);


  @override
  Widget build(BuildContext context) {
    print(next);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonDesign("previous", () => onClick(previous)),
        SizedBox(
          width: 25,
        ),
        next == null ? Container() : ButtonDesign("next", () => onClick(next)),
      ],
    );
  }
}
