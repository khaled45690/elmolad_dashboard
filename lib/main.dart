import 'package:elmolad_dashboard/Screens/MainScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ElmoladDashboard());
}

class ElmoladDashboard extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: MainScreen(),
        routes: {
          MainScreen.routeName: (ctx) => MainScreen(),
        },
      ),
    );
  }
}