import 'package:flutter/material.dart';

class OrderDetailsUpperPart extends StatelessWidget {
  final List keys , values;
  OrderDetailsUpperPart(this.keys , this.values);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int crossAxisCount = size.width > 700 ? 2 : 1;
    return Container(
        margin: EdgeInsets.only(top: 30),

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
        child: GridView.count(
          shrinkWrap: true,
          addAutomaticKeepAlives: true,
          childAspectRatio: 9/1,
          scrollDirection: Axis.vertical,
          crossAxisCount: crossAxisCount,
          physics: ScrollPhysics(),
          children: [
            for (int i = 0 ; i  < keys.length ; i++)
              Container(
                margin: EdgeInsets.only(top: 20, right: 30),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "${keys[i]}: ",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      child: Text(
                       "${keys[i] == "date" ? values[i].toString().substring(0 , 10): values[i].toString()}",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),);
  }
}
