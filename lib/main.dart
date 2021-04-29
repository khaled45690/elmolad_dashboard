import 'package:elmolad_dashboard/ProviderModels/CategoryAndBrandImportantInfo.dart';
import 'package:elmolad_dashboard/ProviderModels/ColorAndSizeImportantInfo.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Screens/AddManufacturScreen.dart';
import 'package:elmolad_dashboard/Screens/AddMainProductScreen.dart';
import 'package:elmolad_dashboard/Screens/AddSizeScreen.dart';
import 'package:elmolad_dashboard/Screens/AddStoreScreen.dart';
import 'package:elmolad_dashboard/Screens/ColorPickerScreen.dart';
import 'package:elmolad_dashboard/Screens/NotificationScreen.dart';
import 'package:elmolad_dashboard/Screens/ReviewsScreen.dart';
import 'package:elmolad_dashboard/Screens/ManufacturerListScreen.dart';
import 'package:elmolad_dashboard/Screens/MainProductInfo.dart';
import 'package:elmolad_dashboard/Screens/SendNotificationsScreen.dart';
import 'package:elmolad_dashboard/Screens/ShowColorsScreen.dart';
import 'package:elmolad_dashboard/Screens/ShowSizesScreen.dart';
import 'package:elmolad_dashboard/Screens/SignInScreen.dart';
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
        ChangeNotifierProvider(create: (_) => CategoryAndBrandImportantInfo()),
        ChangeNotifierProvider(create: (_) => ColorAndSizeImportantInfo()),
        ChangeNotifierProvider(create: (_) => UserData()),
      ],
      child: ElmoladDashboard(),
    ),
  );
}
class ElmoladDashboard extends StatefulWidget {
  @override
  _ElmoladDashboardState createState() => _ElmoladDashboardState();
}

class _ElmoladDashboardState extends State<ElmoladDashboard> {
  Map data = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserData userData = Provider.of<UserData>(context , listen: false);
    userData.checkIfUserDataOnMobileStorage();
  }
  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Elmoolad Dashboard',
        home: userData.userData["access_token"] == null ? SignInScreen() : MainScreen(),
        routes: {
          MainScreen.routeName: (ctx) => MainScreen(),
          AddMainProductScreen.routeName: (ctx) => AddMainProductScreen(),
          // AddSubProductsScreen.routeName: (ctx) => AddSubProductsScreen(),
          AddManufacturScreen.routeName: (ctx) => AddManufacturScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          // OrderDetailsScreen.routeName: (ctx) => OrderDetailsScreen(),
          AddStoreScreen.routeName: (ctx) => AddStoreScreen(),
          ManufacturListScreen.routeName: (ctx) => ManufacturListScreen(),
          StoresListScreen.routeName: (ctx) => StoresListScreen(),
          UsersListScreen.routeName: (ctx) => UsersListScreen(),
          UserDetailsScreen.routeName: (ctx) => UserDetailsScreen(),
          MainProductInfo.routeName: (ctx) => MainProductInfo(),
          // SubProductInfo.routeName: (ctx) => SubProductInfo(),
          // EditSubProductScreen.routeName: (ctx) => EditSubProductScreen(),
          SignInScreen.routeName: (ctx) => SignInScreen(),
          ColorPickerScreen.routeName: (ctx) => ColorPickerScreen(),
          AddSizeScreen.routeName: (ctx) => AddSizeScreen(),
          ShowSizesScreen.routeName: (ctx) => ShowSizesScreen(),
          ShowColorsScreen.routeName: (ctx) => ShowColorsScreen(),
          ReviewsScreen.routeName: (ctx) => ReviewsScreen(),
          NotificationScreen.routeName: (ctx) => NotificationScreen(),
          SendNotificationScreen.routeName: (ctx) => SendNotificationScreen(),
        },
      ),
    );
  }
}

