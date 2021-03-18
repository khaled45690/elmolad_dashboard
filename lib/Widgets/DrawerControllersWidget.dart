import 'package:flutter/material.dart';

class DrawerControllersWidget extends StatelessWidget {
  final String text;
  final Function func;

  const DrawerControllersWidget(this.text, this.func);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: func,
      color: Colors.white,
      focusColor: Colors.lightBlueAccent,
      hoverColor: Colors.lightBlueAccent.withOpacity(0.6),
      splashColor: Colors.blue,
      child: Container(
        height: 70,
        child: Center(
          child: Text(
            text,
            style:
                TextStyle(fontSize: 23, fontWeight: FontWeight.bold, height: 1),
            overflow: TextOverflow.visible,
          ),
        ),
      ),
    );
  }
}
