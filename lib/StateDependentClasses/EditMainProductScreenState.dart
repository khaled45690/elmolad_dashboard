import 'dart:convert';
import 'package:elmolad_dashboard/Alerts/loadingAlert.dart';
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/Functions/uploadImage.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:file_picker/file_picker.dart';
import 'package:elmolad_dashboard/ProviderModels/CategoryAndBrandImportantInfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:objectid/objectid.dart';
import 'package:provider/provider.dart';

class EditMainProductScreenState {
  final state;

  EditMainProductScreenState(this.state);

  onSubmitFunc() async{
    this.state.data.forEach((key, value) {
      this.state.modifiedData["categoryName"] = this.state.categoryValue;
      if(this.state.modifiedData[key] == null){
        this.state.modifiedData[key] = this.state.data[key];
      }
    });
       loadingAlert(this.state.context);
      CategoryAndBrandImportantInfo importantInfo = Provider.of<CategoryAndBrandImportantInfo>(this.state.context , listen: false);
      UserData userData = Provider.of<UserData>(this.state.context , listen: false);
      importantInfo.brandList.forEach((element) {
        if(this.state.brandValue == element["brandName"]){
          this.state.modifiedData["brandsId"] = element["Id"];
          this.state.modifiedData["brandId"] = element["Id"];
        }
      });

      importantInfo.categoryMap.forEach((key, value) {
        if(key.toString() == this.state.modifiedData["Gender"].toString()){
          print("enterrrrrreeeeeee");
          value.forEach((element) {
            print(this.state.categoryValue == element["categoryName"]);
            if(this.state.categoryValue == element["categoryName"]){
              print("enterrrrrreeeeeee");
              this.state.modifiedData["categoryId"] = element["id"];
            }
          });
        }
      });
      print("this.state.data");

      this.state.modifiedData["priceAfterDiscount"] = null;
      print(this.state.modifiedData);
      var response = await http.post(
          Uri.parse('$serverURL/api/Product/EditMinProduct'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization' : 'Bearer ${userData.userData["access_token"]}'
          },
          body: jsonEncode(this.state.modifiedData)
      );

      print(response.statusCode);
      print(response.body);
      Navigator.of(this.state.context).pop();
      if(response.statusCode < 300){
        Navigator.of(this.state.context).pop();
        Navigator.of(this.state.context).pop();
      }else{
        ScaffoldMessenger.of(this.state.context).showSnackBar(SnackBar(content: Text("something went wrong") , backgroundColor: Colors.red,));
    }

  }
  loadAssets()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result != null) {
      ScaffoldMessenger.of(this.state.context).showSnackBar(SnackBar(content: Text("wait till image be uploaded")));
      result.files.forEach((element) async {
        final id = ObjectId();
        http.StreamedResponse response = await uploadImages(element.bytes!.buffer.asUint8List(), "image${id.hexString}.${element.extension}");
        if(response.statusCode < 300){
          response.stream.transform(utf8.decoder).listen((value) {
            Map body = jsonDecode(value);
            this.state.setState(() {
              this.state.modifiedData["bestSellerImg"] = body["imgName"][0];
              print(this.state.modifiedData["bestSellerImg"]);
              ScaffoldMessenger.of(this.state.context).showSnackBar(SnackBar(content: Text("image has been uploaded") , backgroundColor: Colors.green,));
            });
          });
        }else{
          ScaffoldMessenger.of(this.state.context).showSnackBar(SnackBar(content: Text("image has not been uploaded") , backgroundColor: Colors.red,));
        }

      });

    } else {
      // User canceled the picker
    }
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