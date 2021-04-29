import 'dart:convert';

import 'package:elmolad_dashboard/Alerts/loadingAlert.dart';
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "/SignInScreen";
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Map data = {
    "PassWord":null,
    "UserName":null
  };
  Map dataError={
    "PassWord":null,
    "UserName":null
  };
  onChange(value , valueName){
    setState(() {
      data[valueName] = value;
      dataError[valueName] = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("sign in" , style: TextStyle(color: Colors.black),),
      ),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
             Container(
                    width: 300,
                    child: CustomTextField("Email", dataError["UserName"], (value) => onChange(value , "UserName"))),
                Container(
                    width: 300,
                    child: CustomTextField("Password", dataError["PassWord"], (value) => onChange(value , "PassWord"), obscureText: true,)),
                SizedBox(
                  height: 40,
                ),
                ButtonDesign("Sign In", submit),
              ],
            ),
          ),
        ),
      ),
    );
  }

  submit()async{
    UserData userData = Provider.of<UserData>(context , listen: false);
    if(check()){
      loadingAlert(context);
      print('$serverURL/api/Account/CustomToken');
      var response = await http.post(
          Uri.parse('$serverURL/api/Account/CustomToken'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data)
      );
      print(response.statusCode);
      print(response.body);
      if(response.statusCode < 300){
        Navigator.of(context).pop();
        userData.updateUserInfo(jsonDecode(response.body));
      }else{
        Navigator.of(context).pop();
      }

    }
  }

  check(){
    bool check = true;
    data.forEach((key, value) {
      if(data[key] == null) {
        setState(() {
          dataError[key] = "this field is required";
          check = false;
        });
      }
    });
    return check;
  }
}
