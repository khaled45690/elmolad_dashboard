import 'dart:convert';

import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ColorAndSizeImportantInfo with ChangeNotifier, DiagnosticableTreeMixin {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // start size important data
  // start size important data
  // start size important data
  late List _sizeList = [];

  List get sizeList => _sizeList;

  set sizeList(List sizeListParameter) {
    _sizeList = sizeListParameter;
    notifyListeners();
  }

  List<String> _sizeName = ["M"];

  List<String> get sizeName => _sizeName;

  set sizeName(List<String> sizeListParameter) {
    _sizeName = sizeListParameter;
    notifyListeners();
  }
  // end size important data
  // end size important data
  // end size important data


  // start color important data
  // start color important data
  // start color important data
  late List _colorList = [];

  List get colorList => _colorList;


  set colorList(List colorParameter) {
    _colorList = colorParameter;
    notifyListeners();
  }
  late List<String> _colorName = ["black"];

  List<String> get colorName => _colorName;

  set colorName(List<String> colorListParameter) {
    _colorName = colorListParameter;
    notifyListeners();
  }
  // end color important data
  // end color important data
  // end color important data
  getInfo() async {
    final SharedPreferences prefs = await _prefs;
    List<String> arr = [];
    var response = await http.get(
      Uri.parse('$serverURL/api/Size/SizeList'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    sizeList = jsonDecode(response.body);
    _sizeList.forEach((element) {
      arr.add(element["name"]);
    });
    sizeName = arr;
    prefs.setString("sizeName", jsonEncode(arr));
    List<String> arr2 = [];
    var response2 = await http.get(
      Uri.parse('$serverURL/api/Color/ColorList'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    colorList = jsonDecode(response2.body);
    _colorList.forEach((element) {
      arr2.add(element["name"]);
    });
    colorName = arr2;
    prefs.setString("colorName", jsonEncode(arr2));

  }

  getInfoFromLocal()async{
    final SharedPreferences prefs = await _prefs;
     colorName = jsonDecode(prefs.getString("colorName")!).cast<String>();
     sizeName = jsonDecode(prefs.getString("sizeName")!).cast<String>() ;
  }

}
