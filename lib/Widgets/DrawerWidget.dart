import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: 250,
        height: size.height,
        color: Colors.white,
        child: Column(
          children: [
          Text("تسجيل دخول")
          ],
        ),
      ),
    );
  }
}
