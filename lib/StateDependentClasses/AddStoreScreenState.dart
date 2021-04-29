import 'dart:convert';

import 'package:elmolad_dashboard/Alerts/loadingAlert.dart';
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/Functions/uploadImage.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:objectid/objectid.dart';
import 'package:provider/provider.dart';

class AddStoreScreenState {
  final state;

  AddStoreScreenState(this.state);
  addStore() async{
    UserData userData = Provider.of<UserData>(this.state.context , listen: false);
    if (check() && checkPassword()) {
      if(this.state.data["Email"].contains(" ")){
        this.state.setState(() {
          this.state.dataError["Email"] = "make sure there is no white places in this field";
        });
      }else{
        loadingAlert(this.state.context);
        var response = await http.post(
            Uri.parse('$serverURL/api/Store/Add'),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization' : 'Bearer ${userData.userData["access_token"]}'
            },
            body: jsonEncode(this.state.data)
        );
        print(response.body);
        Navigator.of(this.state.context).pop();
        if(response.statusCode < 300){
          ScaffoldMessenger.of(this.state.context).showSnackBar(SnackBar(content: Text("the Store has been added successfully") ,backgroundColor: Colors.green,));
        }else{
          ScaffoldMessenger.of(this.state.context).showSnackBar(SnackBar(content: Text("something went wrong"),backgroundColor: Colors.red,));
        }
      }
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
        var response = await uploadImages(element.bytes!.buffer.asUint8List(), "image${id.hexString}.${element.extension}");
        response.stream.transform(utf8.decoder).listen((value) {
          Map body = jsonDecode(value);
          this.state.setState(() {
            this.state.data["imgName"] = body["imgName"][0];
            this.state.dataError["imgName"] = null;
            print(this.state.data["imgName"]);
            ScaffoldMessenger.of(this.state.context).showSnackBar(SnackBar(content: Text("image has been uploaded") , backgroundColor: Colors.green,));
          });
        });

      });

    } else {
      // User canceled the picker
    }
  }


  check() {
    bool check = true;
    this.state.data.forEach((key, value) {
      if (value == null || value == "") {
        print('$key   $value');
        this.state.setState(() {
          this.state.dataError[key] = "this field is required";
        });
        check = false;
      }
    });

    return check;
  }

  onChange(String value, String variableName) {
    this.state.setState(() {
      this.state.data[variableName] = value;
      this.state.dataError[variableName] = null;
    });
  }

  checkPassword() {
    bool check = true;
    if (this.state.data["Password"] == this.state.data["ConfirmPassword"]) {
      return check;
    } else {
      this.state.setState(() {
        this.state.dataError["Password"] =
            "check password and confirm password must are same";
        this.state.dataError["ConfirmPassword"] =
            "check if password and confirm password are same";
      });
      return false;
    }
  }
}
