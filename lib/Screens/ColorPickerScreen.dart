import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerScreen extends StatefulWidget {
  static const String routeName = "/ColorPicker";
  @override
  _ColorPickerScreenState createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  Color pickerColor = Colors.redAccent.shade100;
  Map data = {};
  @override
  Widget build(BuildContext context) {
    print(pickerColor.toString().substring(10, 16));
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonDesign("pick color", pickColor),
                Container(width: 60, height: 60, color: pickerColor),
                Text(pickerColor.toString().substring(10, 16)),
              ],
            ),
            ButtonDesign("Add", pickColor),
          ],
        ),
      ),
    );
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
                setState(() => data["ColorPicked"] = pickerColor.toString().substring(10, 16));
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
