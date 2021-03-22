import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/MainScreenLowerPart.dart';
import 'package:elmolad_dashboard/Widgets/MainScreenUpperPart.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/MainScreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerWidget(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainScreenUpperPart(),
              SizedBox(height: 30,),
              Text("Last 10 Orders" , style: TextStyle(fontWeight: FontWeight.w700 , fontSize: 22 , letterSpacing: 5) ,),
              SizedBox(height: 30,),
              MainScreenLowerPart(),
            ],
          ),
        ),
      ),
    );
  }
}
