import 'dart:convert';

import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CategoryAndBrandImportantInfo with ChangeNotifier, DiagnosticableTreeMixin {
  // start brand important data
  // start brand important data
  // start brand important data
  late List _brandList;

  List get brandList => _brandList;

  set brandList(List brandListParameter) {
    _brandList = brandListParameter;
    notifyListeners();
  }
  late List<String> _brandName;

  List<String> get brandName => _brandName;

  set brandName(List<String> brandListParameter) {
    _brandName = brandListParameter;
    notifyListeners();
  }
  // end brand important data
  // end brand important data
  // end brand important data


  // start category important data
  // start category important data
  // start category important data
  late Map _categoryMap;

  Map get categoryMap => _categoryMap;


  set categoryMap(Map categoryParameter) {
    _categoryMap = categoryParameter;
    notifyListeners();
  }
  List<String> _categoryNameList = ["Top" , "Pants" , "SHOES"];
  List<String> get categoryNameList => _categoryNameList;
  // end category important data
  // end category important data
  // end category important data
  getInfo() async {
    List<String> arr = [];
    var response = await http.get(
      Uri.parse('$serverURL/api/Brands/list'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    print(response.body);
    brandList = jsonDecode(response.body);
    _brandList.forEach((element) {
      arr.add(element["brandName"]);
    });
    brandName = arr;
    Map responseBody = {};
    var response2 = await http.get(
      Uri.parse('$serverURL/api/Product/ListCategoryId?MainCategoryId=1'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    responseBody["1"] = jsonDecode(response2.body);
    var response3 = await http.get(
      Uri.parse('$serverURL/api/Product/ListCategoryId?MainCategoryId=2'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    responseBody["2"] = jsonDecode(response3.body);
    categoryMap = responseBody;
    print(_categoryMap);

  }

}
