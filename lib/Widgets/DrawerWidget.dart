import 'package:elmolad_dashboard/Screens/AddManufacturScreen.dart';
import 'package:elmolad_dashboard/Screens/AddMainProductScreen.dart';
import 'package:elmolad_dashboard/Screens/AddSizeScreen.dart';
import 'package:elmolad_dashboard/Screens/AddStoreScreen.dart';
import 'package:elmolad_dashboard/Screens/ColorPickerScreen.dart';
import 'package:elmolad_dashboard/Screens/NotificationScreen.dart';
import 'package:elmolad_dashboard/Screens/ReviewsScreen.dart';
import 'package:elmolad_dashboard/Screens/ManufacturerListScreen.dart';
import 'package:elmolad_dashboard/Screens/MainProductInfo.dart';
import 'package:elmolad_dashboard/Screens/OrdersScreen.dart';
import 'package:elmolad_dashboard/Screens/SendNotificationsScreen.dart';
import 'package:elmolad_dashboard/Screens/ShowColorsScreen.dart';
import 'package:elmolad_dashboard/Screens/ShowSizesScreen.dart';
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
  Map<String , double> data = {
    "Product": 0,
    "Manufacturer": 0,
    "Brand": 0,
    "Colors": 0,
    "Sizes": 0,
    "Others": 0,
  };
  Map<String , double> size = {
    "Product": 210,
    "Manufacturer": 140,
    "Brand": 140,
    "Colors": 140,
    "Sizes": 140,
    "Others": 280,
  };
  onChange(variableName) {
    setState(() {
      if (data[variableName] == size[variableName]) {
        data[variableName] = 0;
      } else {
        data.forEach((key, value) {
          if (variableName == key) {
            data[variableName] = size[variableName]!;
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
            topRight: Radius.circular(30)),
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
              height: 50,
            ),
            DrawerControllersWidget("Product", () {
              onChange("Product");
            }),
            ClipRect(
              child: AnimatedContainer(
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
            ),
            DrawerControllersWidget("Manufacturer", () {
              onChange("Manufacturer");
            }),
            AnimatedContainer(
              height: data["Manufacturer"],
              duration: Duration(milliseconds: 300),
              child: Column(
                children: [
                  DrawerTabsWidget("Add Manufacturer", AddManufacturScreen.routeName),
                  DrawerTabsWidget("Manufacturers", ManufacturListScreen.routeName),
                ],
              ),
            ),
            DrawerControllersWidget("Brand", () {
              onChange("Brand");
            }),
            AnimatedContainer(
              height: data["Brand"],
              duration: Duration(milliseconds: 300),
              child: Column(
                children: [
                  DrawerTabsWidget("Add brand", AddStoreScreen.routeName),
                  DrawerTabsWidget("Brand", StoresListScreen.routeName),
                ],
              ),
            ),
            DrawerControllersWidget("Colors", () {
              onChange("Colors");
            }),
            AnimatedContainer(
              height: data["Colors"],
              duration: Duration(milliseconds: 300),
              child: Column(
                children: [
                  DrawerTabsWidget("Add color", ColorPickerScreen.routeName),
                  DrawerTabsWidget("Show colors", ShowColorsScreen.routeName),
                ],
              ),
            ),
            DrawerControllersWidget("Sizes", () {
              onChange("Sizes");
            }),
            AnimatedContainer(
              height: data["Sizes"],
              duration: Duration(milliseconds: 300),
              child: Column(
                children: [
                  DrawerTabsWidget("Add size", AddSizeScreen.routeName),
                  DrawerTabsWidget("Show sizes", ShowSizesScreen.routeName),
                ],
              ),
            ),

            DrawerControllersWidget("Others", () {
              onChange("Others");
            }),
            AnimatedContainer(
              height: data["Others"],
              duration: Duration(milliseconds: 300),
              child: Column(
                children: [
                  DrawerTabsWidget("users", UsersListScreen.routeName),
                  DrawerTabsWidget("Reviews", ReviewsScreen.routeName),
                  DrawerTabsWidget("Notifications", NotificationScreen.routeName),
                  DrawerTabsWidget("SendNotification", SendNotificationScreen.routeName),
                ],
              ),
            ),
            Container(
              height: 280,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
