
import 'dart:convert';

import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/ProviderModels/CategoryAndBrandImportantInfo.dart';
import 'package:elmolad_dashboard/Screens/AddSubProductsScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AddMainProductScreenState {
  final state;

  AddMainProductScreenState(this.state);

  onSubmitFunc() async{
    if (check()) {
      // loadingAlert();
      // CategoryAndBrandImportantInfo importantInfo = Provider.of<CategoryAndBrandImportantInfo>(this.state.context , listen: false);
      // importantInfo.brandList.forEach((element) {
      //   if(this.state.brandValue == element["brandName"]){
      //     this.state.data["brandsId"] = element["Id"];
      //   }
      // });
      //
      // importantInfo.categoryMap.forEach((key, value) {
      //   if(key == this.state.data["Gender"].toString()){
      //     value.forEach((element) {
      //       print(this.state.categoryValue == element["categoryName"]);
      //       if(this.state.categoryValue == element["categoryName"]){
      //         this.state.data["categoryId"] = element["id"];
      //       }
      //     });
      //   }
      //
      // });
      // var response = await http.post(
      //   Uri.parse('$serverURL/api/Product/AddMinProduct'),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json',
      //   },
      //   body: jsonEncode(this.state.data)
      // );
      //
      // print(response.statusCode);
      // print(response.body);
      Navigator.of(this.state.context)
          .popAndPushNamed(AddSubProductsScreen.routeName , arguments: "64");
    }
  }

  onChange(value, variableName) {
    this.state.setState(() {
      this.state.data[variableName] = value;
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
      // this.state.value = filter[0];
    });
  }

  check() {
    bool check = true;
    this.state.data.forEach((key, value) {
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

  loadingAlert() {
    return showDialog(
      barrierDismissible: false,
      context: this.state.context,
      builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;
        return Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(17),
                      topLeft: Radius.circular(17)),
                ),
                width: size.width,
                height: 200,
                child: Center(
                    child: Container(
                        height: 100,
                        child: Image.asset(
                          "assets/tenor.gif",
                          width: 100,
                          height: 100,
                        ))),
              ),
            ),
          ],
        );
      },
    );
  }
}
