import 'dart:convert';

import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/Functions/uploadImage.dart';
import 'package:elmolad_dashboard/ProviderModels/ColorAndSizeImportantInfo.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:objectid/objectid.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AddSubProductScreenState {
  final state;

  AddSubProductScreenState(this.state);
  onSubmit()async{
    UserData userData = Provider.of<UserData>(this.state.context , listen: false);
    Map data = {};
    data["minProductId"] = this.state.data["minProductId"];
    data["imagesList"] = this.state.data["imagesList"];
    if(this.state.data["imagesList"].length == 0){
      ScaffoldMessenger.of(this.state.context).showSnackBar(SnackBar(content: Text("please insert at least one image")));
    }else{
      ColorAndSizeImportantInfo importantInfo = Provider.of<ColorAndSizeImportantInfo>(this.state.context , listen: false);
      importantInfo.colorList.forEach((element) {
        print(element);
        if(element["name"] == this.state.data["colorValue"]){
          data["colorId"]= element["id"];
        }
      });

      importantInfo.sizeList.forEach((element) {
        print(element);
        if(element["name"] == this.state.data["sizeValue"]){
          data["sizeId"]= element["id"];
          print(data);
        }
      });
      var response = await http.post(
        Uri.parse('$serverURL/api/Product/AddAdProduct'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization' : 'Bearer ${userData.userData["access_token"]}'
        },
        body: jsonEncode(data)
      );

      print(response.statusCode);
      print(response.body);
      if(response.statusCode < 300){
        this.state.setState(() {
          this.state.isDone = true;
        });
      }else{
        ScaffoldMessenger.of(this.state.context).showSnackBar(SnackBar(content: Text("something went wrong")));
      }


    }
  }

  colorChange(value) {
    this.state.setState(() {
      this.state.data["colorValue"] = value;
    });
  }

  sizeChange(value) {
    this.state.setState(() {
      this.state.data["sizeValue"] = value;
    });
  }

  colorSearchFunction(value) {
    List<String> filter = [];
    ColorAndSizeImportantInfo importantInfo =
        Provider.of<ColorAndSizeImportantInfo>(this.state.context,
            listen: false);
    importantInfo.colorName.forEach((element) {
      if (element.length < value.length) {
      } else {
        if (element.substring(0, value.length).toLowerCase() ==
            value.toLowerCase()) {
          filter.add(element);
        }
      }
    });
    this.state.setState(() {
      this.state.colorListFilter = filter;
      // this.state.value = filter[0];
    });
  }

  sizeSearchFunction(value) {
    List<String> filter = [];
    ColorAndSizeImportantInfo importantInfo =
        Provider.of<ColorAndSizeImportantInfo>(this.state.context,
            listen: false);
    importantInfo.sizeName.forEach((element) {
      if (element.length < value.length) {
      } else {
        if (element.substring(0, value.length).toLowerCase() ==
            value.toLowerCase()) {
          filter.add(element);
        }
      }
    });

    this.state.setState(() {
      this.state.sizeListFilter = filter;
    });
  }

  Future<void> loadAssets() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result != null) {
      ScaffoldMessenger.of(this.state.context).showSnackBar(SnackBar(content: Text("wait till image be uploaded")));
      result.files.forEach((element) async {
        final id = ObjectId();
        var response = await uploadImages(element.bytes!.buffer.asUint8List(), "image${id.hexString}.${element.extension}");
        response.stream.transform(utf8.decoder).listen((value) {
          Map body = jsonDecode(value);
          this.state.setState(() {
            this.state.data["imagesList"].add(body["imgName"][0]);
            print(this.state.data["imagesList"]);
            if(result.files.length == this.state.data["imagesList"].length){
              ScaffoldMessenger.of(this.state.context).showSnackBar(SnackBar(content: Text("all images has been uploaded")));
            }
          });


        });

      });
      print( this.state.data["imagesList"]);

    } else {
      // User canceled the picker
    }
  }
}
