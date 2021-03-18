import 'package:elmolad_dashboard/ProviderModels/ScreenSize.dart';
import 'package:elmolad_dashboard/Screens/AddRoomScreen.dart';
import 'package:elmolad_dashboard/Screens/AddMainProductScreen.dart';
import 'package:elmolad_dashboard/Screens/AddStoreScreen.dart';
import 'package:elmolad_dashboard/Screens/AddSubProductsScreen.dart';
import 'package:elmolad_dashboard/Screens/EditMainProductScreen.dart';
import 'package:elmolad_dashboard/Screens/EditSubProductScreen.dart';
import 'package:elmolad_dashboard/Screens/RoomListScreen.dart';
import 'package:elmolad_dashboard/Screens/MainProductInfo.dart';
import 'package:elmolad_dashboard/Screens/SubProductInfo.dart';
import 'package:elmolad_dashboard/Screens/OrderDetailsScreen.dart';
import 'package:elmolad_dashboard/Screens/OrdersScreen.dart';
import 'package:elmolad_dashboard/Screens/MainScreen.dart';
import 'package:elmolad_dashboard/Screens/StoresListScreen.dart';
import 'package:elmolad_dashboard/Screens/UserDetailScreen.dart';
import 'package:elmolad_dashboard/Screens/UserListScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScreenSize()),
      ],
      child: ElmoladDashboard(),
    ),
  );
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
          AddMainProductScreen.routeName: (ctx) => AddMainProductScreen(),
          AddSubProductsScreen.routeName: (ctx) => AddSubProductsScreen(),
          AddRoomScreen.routeName: (ctx) => AddRoomScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          OrderDetailsScreen.routeName: (ctx) => OrderDetailsScreen(),
          AddStoreScreen.routeName: (ctx) => AddStoreScreen(),
          RoomListScreen.routeName: (ctx) => RoomListScreen(),
          StoresListScreen.routeName: (ctx) => StoresListScreen(),
          UsersListScreen.routeName: (ctx) => UsersListScreen(),
          UserDetailsScreen.routeName: (ctx) => UserDetailsScreen(),
          MainProductInfo.routeName: (ctx) => MainProductInfo(),
          SubProductInfo.routeName: (ctx) => SubProductInfo(),
          EditMainProductScreen.routeName: (ctx) => EditMainProductScreen(),
          EditSubProductScreen.routeName: (ctx) => EditSubProductScreen(),
        },
      ),
    );
  }
}
