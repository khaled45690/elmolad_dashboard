import 'package:flutter/material.dart';

class OrderDetailsUpperPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.width > 700 ? 300 : 460;
    double width = size.width > 700 ? 650 : 350;
    int numberOfColumn = size.width > 700 ? 2 : 1;
    int numberOfRows = size.width > 700 ? 5 : 9;
    return Container(
        margin: EdgeInsets.only(top: 30),
        height: height,
        width: width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int k = 0; k < numberOfRows; k++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int j = 0; j < numberOfColumn; j++)
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 30),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              "State : ",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            child: Text(
                              "State variable",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              )
          ],
        ));
  }
}
