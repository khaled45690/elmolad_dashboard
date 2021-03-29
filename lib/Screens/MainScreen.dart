import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/CategoryAndBrandImportantInfo.dart';
import 'package:elmolad_dashboard/ProviderModels/ColorAndSizeImportantInfo.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:elmolad_dashboard/Widgets/MainScreenLowerPart.dart';
import 'package:elmolad_dashboard/Widgets/MainScreenUpperPart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class MainScreen extends StatefulWidget {
  static const routeName = '/MainScreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryAndBrandImportantInfo importantInfo = Provider.of<CategoryAndBrandImportantInfo>(context , listen: false);
    ColorAndSizeImportantInfo importantInfo2 = Provider.of<ColorAndSizeImportantInfo>(context , listen: false);
    importantInfo.getInfo();
    importantInfo2.getInfo();
  }

  void get() async {
    print("dâ");
    // https://jsonplaceholder.typicode.com/todos/1
    var response = await http.get(
      Uri.parse('$serverURL/api/Brands/list'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    print(response.body);


    var response2 = await http.get(
      Uri.parse('$serverURL/api/Review/AllReview'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    print(response2.body);
  }

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
              Text("Last 10 Orders", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  letterSpacing: 5),),
              SizedBox(height: 30,),
              MainScreenLowerPart(),
            ],
          ),
        ),
      ),
    );
  }
}

