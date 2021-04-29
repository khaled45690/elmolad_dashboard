import 'package:flutter/material.dart';

class MainScreenUpperPart extends StatelessWidget {
  final Map info;
  MainScreenUpperPart(this.info);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    double height = 250;
    double width =  350;
    // int numberOfColumn = size.width > 700 ? 2 : 1;
    // int numberOfRows = size.width > 700 ? 5 : 9;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 30),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              "Number OF Stores : ",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            child: Text(
                              info["NumOFStores"] == null ? "" : info["NumOFStores"].toString(),
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, right: 30),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "Number OF Orders : ",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        child: Text(
                          info["NumOfOrders"] == null ? "" : info["NumOfOrders"].toString(),
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, right: 30),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "Number OF Products : ",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        child: Text(
                          info["NumOfProducts"] == null ? "" : info["NumOfProducts"].toString(),
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, right: 30),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "Number OF Users : ",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        child: Text(
                          info["NumOfUsers"] == null ? "" : info["NumOfUsers"].toString(),
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
