import 'package:elmolad_dashboard/Alerts/loadingAlert.dart';
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AddSizeScreen extends StatefulWidget {
  static const routeName = "/AddSize";
  @override
  _AddSizeScreenState createState() => _AddSizeScreenState();
}

class _AddSizeScreenState extends State<AddSizeScreen> {
  Map data = {
    "sizeName":null
  };
  Map dataError = {
    "sizeName":null
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Add Size" , style: TextStyle(color: Colors.black),),
        actions: [
          MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.keyboard_return_sharp)),
        ],
      ),
      drawer: DrawerWidget(),
    body: Center(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.all(Radius.circular(10)),

          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        width: 400,
        height: 260,
        child: Column(
          children: [
            Container(
                width: 300,
                child: CustomTextField("Size name", dataError["sizeName"], sizeChange)),
            SizedBox(
              height: 40,
            ),
            ButtonDesign("Add", submit),
          ],
        ),
      ),
    ),
    );
  }
  submit()async{
    if(data["sizeName"] == null || data["sizeName"] == ""){
      setState(() {
        dataError["sizeName"] = "this field is required";
      });
    }else{
      if(data["sizeName"].contains(" ")){
        setState(() {
          dataError["sizeName"] = "make sure there is no space in the name";
        });
      }else{
        UserData userData = Provider.of<UserData>(context , listen: false);
        loadingAlert(context);
        print(Uri.parse("$serverURL/api/Color/Add?colorName=${data["sizeName"]}"));
        var response = await http.get(
          Uri.parse("$serverURL/api/Size/Add?sizeName=${data["sizeName"]}"),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization' : 'Bearer ${userData.userData["access_token"]}'
          },
        );
        Navigator.of(context).pop();
        if(response.statusCode < 300){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("the Size has been added successfully") ,backgroundColor: Colors.green,));
        }else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("something went wrong"),backgroundColor: Colors.red,));
        }
        print(response.statusCode);
        print(response.body);
      }
    }
  }

  sizeChange(sizeValue) {
    setState(() {
      data["sizeName"] = sizeValue;
      dataError["sizeName"] = null;
    });
  }
}
