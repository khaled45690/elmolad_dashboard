import 'package:flutter/material.dart';

loadingAlert(context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      Size size = MediaQuery.of(context).size;
      return Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(17),
                    topLeft: Radius.circular(17)),
              ),
              width: size.width,
              height: 200,
              child: Center(
                  child: Container(
                      height: 100,
                      child: Image.asset(
                        "assets/tenor.gif",
                        width: 100,
                        height: 100,
                      ))),
            ),
          ),
        ],
      );
    },
  );
}