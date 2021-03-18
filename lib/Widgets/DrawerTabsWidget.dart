import 'package:flutter/material.dart';

class DrawerTabsWidget extends StatelessWidget {
  final String text, routeName;

  const DrawerTabsWidget(this.text, this.routeName);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).popAndPushNamed(routeName);
      },
      color: Colors.grey.shade300,
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
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }
}
