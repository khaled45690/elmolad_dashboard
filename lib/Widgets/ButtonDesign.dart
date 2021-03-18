import 'package:flutter/material.dart';

class ButtonDesign extends StatelessWidget {
  final String text;
  final Function func;

  const ButtonDesign(this.text, this.func);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenSize = size.width > 700 ? 700 : size.width;
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: func,
        splashColor: Colors.blue,
        child: Container(
          width: screenSize / 3.5,
          height: size.height / 10,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.lightBlueAccent.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.lightBlueAccent.shade400.withOpacity(0.4),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: screenSize / 25, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
