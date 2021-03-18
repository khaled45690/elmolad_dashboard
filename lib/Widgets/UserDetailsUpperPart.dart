import 'package:flutter/material.dart';

class UserDetailsUpperPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width > 700 ? 650 : 300;
    int numberOfColumn = size.width > 700 ? 2 : 1;
    int numberOfRows = size.width > 700 ? 3 : 5;
    return Center(
      child: Container(
          // margin: EdgeInsets.only(top: 30),
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
                        margin: EdgeInsets.only(top: 10, right: 30, bottom: 10),
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
                              width: 170,
                              child: Text(
                                "State variable",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                )
            ],
          )),
    );
  }
}
