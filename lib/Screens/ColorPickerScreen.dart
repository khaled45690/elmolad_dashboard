import 'package:elmolad_dashboard/Alerts/loadingAlert.dart';
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:http/http.dart' as http;

class ColorPickerScreen extends StatefulWidget {
  static const String routeName = "/ColorPicker";
  @override
  _ColorPickerScreenState createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(data["colorCode"]);
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
            Container(
                width: size.width - 200,
                child: CustomTextField("Color Name", dataError["colorName"], onChange)),
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
            ButtonDesign("Add", submit),
          ],
        ),
      ),
    );
  }
  submit()async{
      if(data["colorName"] == null || data["sizeName"] == ""){
        setState(() {
          dataError["colorName"] = "this field is required";
        });
      }else{
        if(data["colorName"].contains(" ")){
          setState(() {
            dataError["colorName"] = "make sure there is no space in the name";
          });
        }else{
           loadingAlert(context);
          print(Uri.parse("$serverURL/api/Color/Add?colorName=${data["colorName"]}&colorCode=${data["colorCode"]}"));
          var response = await http.get(
            Uri.parse("$serverURL/api/Color/Add?colorName=${data["colorName"]}&colorCode=${data["colorCode"]}"),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
          );
          Navigator.of(context).pop();
          if(response.statusCode < 300){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("the color has been added successfully") ,backgroundColor: Colors.green,));
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("something went wrong"),backgroundColor: Colors.red,));
          }
          print(response.statusCode);
          print(response.body);
        }
      }
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
