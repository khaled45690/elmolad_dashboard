import 'package:elmolad_dashboard/Screens/AddRoomScreen.dart';
import 'package:elmolad_dashboard/Screens/AddMainProductScreen.dart';
import 'package:elmolad_dashboard/Screens/AddStoreScreen.dart';
import 'package:elmolad_dashboard/Screens/RoomListScreen.dart';
import 'package:elmolad_dashboard/Screens/MainProductInfo.dart';
import 'package:elmolad_dashboard/Screens/OrdersScreen.dart';
import 'package:elmolad_dashboard/Screens/StoresListScreen.dart';
import 'package:elmolad_dashboard/Screens/UserListScreen.dart';
import 'package:elmolad_dashboard/Widgets/DrawerControllersWidget.dart';
import 'package:elmolad_dashboard/Widgets/DrawerTabsWidget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Map data = {
    "Product": 0,
    "Room": 0,
    "Stores": 0,
  };
  Map size = {
    "Product": 210,
    "Room": 140,
    "Stores": 140,
  };
  onChange(variableName) {
    setState(() {
      if (data[variableName] == size[variableName]) {
        data[variableName] = 0;
      } else {
        data.forEach((key, value) {
          if (variableName == key) {
            data[variableName] = size[variableName];
          } else {
            data[key] = 0;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
        color: Colors.white,
      ),
      width: 250,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(17)),
                color: Colors.blue,
              ),
              height: 100,
            ),
            DrawerControllersWidget("Product", () {
              onChange("Product");
            }),
            AnimatedContainer(
              height: data["Product"],
              duration: Duration(milliseconds: 300),
              child: Column(
                children: [
                  DrawerTabsWidget(
                      "Add product", AddMainProductScreen.routeName),
                  DrawerTabsWidget(
                      "Products", MainProductInfo.routeName),
                  DrawerTabsWidget("orders", OrdersScreen.routeName),
                ],
              ),
            ),
            DrawerControllersWidget("Room", () {
              onChange("Room");
            }),
            AnimatedContainer(
              height: data["Room"],
              duration: Duration(milliseconds: 300),
              child: Column(
                children: [
                  DrawerTabsWidget("Add Room", AddRoomScreen.routeName),
                  DrawerTabsWidget("Rooms", RoomListScreen.routeName),
                ],
              ),
            ),
            DrawerControllersWidget("Stores", () {
              onChange("Stores");
            }),
            AnimatedContainer(
              height: data["Stores"],
              duration: Duration(milliseconds: 300),
              child: Column(
                children: [
                  DrawerTabsWidget("Add store", AddStoreScreen.routeName),
                  DrawerTabsWidget("stores", StoresListScreen.routeName),
                ],
              ),
            ),
            DrawerTabsWidget("users", UsersListScreen.routeName),
            Container(
              height: 100,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
