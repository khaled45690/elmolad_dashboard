import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/CategoryAndBrandImportantInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditMainProductScreenState {
  final state;

  EditMainProductScreenState(this.state);

  onSubmitFunc() async{
    this.state.data.forEach((key, value) {
      if(this.state.modifiedData[key] == null){
        this.state.modifiedData[key] = this.state.data[key];
      }
    });
      // loadingAlert(this.state.context);
      CategoryAndBrandImportantInfo importantInfo = Provider.of<CategoryAndBrandImportantInfo>(this.state.context , listen: false);
      importantInfo.brandList.forEach((element) {
        if(this.state.brandValue == element["brandName"]){
          this.state.modifiedData["brandsId"] = element["Id"];
          this.state.modifiedData["brandId"] = element["Id"];
        }
      });

      importantInfo.categoryMap.forEach((key, value) {
        if(key == this.state.modifiedData["Gender"].toString()){
          value.forEach((element) {
            print(this.state.categoryValue == element["categoryName"]);
            if(this.state.categoryValue == element["categoryName"]){
              this.state.modifiedData["categoryId"] = element["id"];
            }
          });
        }
      });
      print("this.state.data");
      print(this.state.modifiedData);
      var response = await http.post(
          Uri.parse('$serverURL/api/Product/EditMinProduct'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(this.state.data)
      );

      print(response.statusCode);
      print(response.body);
      Navigator.of(this.state.context).pop();

  }

  onChange(value, variableName) {
    this.state.setState(() {
      this.state.modifiedData[variableName] = value;
      this.state.dataError[variableName] = null;
    });
  }
  dropDownTextChange(value){
    this.state.setState(() {
      this.state.brandValue = value;
    });
  }
  categoryListChange(value){
    this.state.setState(() {
      this.state.categoryValue = value;
    });
  }
  searchFunction(value) {
    List<String> filter = [];
    CategoryAndBrandImportantInfo importantInfo = Provider.of<CategoryAndBrandImportantInfo>(this.state.context , listen: false);
    importantInfo.brandName.forEach((element) {
      if(element.length < value.length){

      }else{
        if(element.substring(0 , value.length).toLowerCase() == value.toLowerCase()){
          filter.add(element);
        }
      }
    });

    this.state.setState(() {
      this.state.brandFilter = filter;
      this.state.value = filter[0];
    });
  }

  check() {
    bool check = true;
    this.state.modifiedData.forEach((key, value) {
      if (value == null) {
        print('$key   $value');
        this.state.setState(() {
          this.state.dataError[key] = "this field is required";
        });
        check = false;
      }
    });

    return check;
  }

}