import 'dart:async';
import 'dart:convert';

import 'package:elmolad_dashboard/Alerts/loadingAlert.dart';
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class EditColorScreen extends StatefulWidget {
  final Map data;

  const EditColorScreen(this.data);
  @override
  _EditColorScreenState createState() => _EditColorScreenState();
}

class _EditColorScreenState extends State<EditColorScreen> {
  Color pickerColor = Colors.redAccent.shade100;
  Map data = {
    "colorCode" : "${Colors.redAccent.shade100.toString().substring(10, 16)}",
    "colorName" : null,
  };

  Map dataError = {
    "colorName" : null,
  };
  onChange(value){
    setState(() {
      data["colorName"] = value;
      dataError["colorName"] = null;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data);
    setState(() {
      pickerColor = Color(int.parse("0xFF${widget.data["colorCode"].substring(1)}"));
      data["colorName"] = widget.data["name"];
      data["PK_Color"] = widget.data["id"];
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Add Color" , style: TextStyle(color: Colors.black),),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.keyboard_return_sharp),),
        ],
      ),
      drawer: DrawerWidget(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Color Name :"),
                Container(
                    width: size.width - 200,
                    child: CustomTextField(widget.data["name"], null , onChange)),
              ],
            ),
            SizedBox(height: 80,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonDesign("pick color", pickColor),
                Container(width: 60, height: 60, color: pickerColor),
                Text(pickerColor.toString().substring(10, 16)),
              ],
            ),
            SizedBox(height: 80,),
            ButtonDesign("Edit", submit),
          ],
        ),
      ),
    );
  }


  submit()async{
        loadingAlert(context);
        UserData userData = Provider.of<UserData>(context , listen: false);
        print(Uri.parse("$serverURL/api/BrandCpanel/Edit"));
        data["Name"] = data["colorName"];
        data["colorCode"] = "#${data["colorCode"]}";
        print(jsonEncode(data));
        var response = await http.post(
          Uri.parse("$serverURL/api/BrandCpanel/Edit"),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization' : 'Bearer ${userData.userData["access_token"]}'
          },
          body: jsonEncode(data),
        );
        Navigator.of(context).pop();
        if(response.statusCode < 300){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("the color has been changed successfully") , backgroundColor: Colors.green,));
        }else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("something went wrong"),backgroundColor: Colors.red,));
        }

        Timer(Duration(milliseconds: 200), (){
          if(response.statusCode < 300){
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }
        });
        print(response.statusCode);
        print(response.body);
  }
  pickColor() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: MaterialPicker(
              pickerColor: pickerColor,
              onColorChanged: colorChange,
              // only on portrait mode
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              child: const Text('Got it'),
              onPressed: () {
                setState(() => data["colorCode"] = "${pickerColor.toString().substring(10, 16)}");
                print(pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  colorChange(colorValue) {
    setState(() {
      pickerColor = colorValue;
    });
  }
}
