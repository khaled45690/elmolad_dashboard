import 'dart:convert';

import 'package:elmolad_dashboard/Alerts/loadingAlert.dart';
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/Functions/uploadImage.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Widgets/ButtonDesign.dart';
import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:elmolad_dashboard/Widgets/DrawerWidget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:objectid/objectid.dart';
import 'package:provider/provider.dart';

class AddManufacturScreen extends StatefulWidget {
  static const routeName = "/AddRoom";
  @override
  _AddManufacturScreenState createState() => _AddManufacturScreenState();
}

class _AddManufacturScreenState extends State<AddManufacturScreen> {
  Map data = {
    "brandName" : null,
    "imgName" : null,
  };
  Map dataError = {
    "brandName" : null,
    "imgName" : null,
  };
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenSize = size.width > 500 ? 500 : size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Add Manufacture" , style: TextStyle(color: Colors.black),),
        actions: [
          MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.keyboard_return_sharp)),
        ],
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: Container(
          width: screenSize,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        margin: EdgeInsets.only(right: 30),
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                          width: 300,
                          child: CustomTextField("Name", dataError["brandName"], onChange)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ButtonDesign("Select image", loadAssets),
                  Text(dataError["imgName"] == null ? "" : dataError["imgName"] , style: TextStyle(color: Colors.red),),
                  SizedBox(
                    height: 200,
                  ),
                  ButtonDesign("add", submit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  submit()async{
    if(check()){
      if(data["brandName"].contains(" ")){
        setState(() {
          dataError["brandName"] = "make sure there is no space in the name";

        });
      }else{
        UserData userData = Provider.of<UserData>(context , listen: false);
        loadingAlert(context);
        print(Uri.parse("$serverURL/api/Brand/Add?imgName=${data["imgName"]}&brandName=${data["brandName"]}"));
        var response = await http.post(
          Uri.parse("$serverURL/api/Brand/Add?imgName=${data["imgName"]}&brandName=${data["brandName"]}"),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization' : 'Bearer ${userData.userData["access_token"]}'
          },
        );
        Navigator.of(context).pop();
        if(response.statusCode < 300){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("the brand has been added successfully") ,backgroundColor: Colors.green,));
        }else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("something went wrong"),backgroundColor: Colors.red,));
        }
        print(response.statusCode);
        print(response.body);
      }
    }
  }
  loadAssets()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowCompression: true,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("wait till image be uploaded")));
      result.files.forEach((element) async {
        final id = ObjectId();
        var response = await uploadImages(element.bytes!.buffer.asUint8List(), "image${id.hexString}.${element.extension}");
        response.stream.transform(utf8.decoder).listen((value) {
          Map body = jsonDecode(value);
          setState(() {
            data["imgName"] = body["imgName"][0];
            dataError["imgName"] = null;
            print(data["imgName"]);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("image has been uploaded")));
          });
        });

      });

    } else {
      // User canceled the picker
    }
  }
  check(){
    bool check = true;
    data.forEach((key, value) {
      if(data[key] == null){
        check = false;
        setState(() {
          dataError[key] = "this field is required";
        });
      }
    });

    return check;
  }
  onChange(brandName) {
    setState(() {
      data["brandName"] = brandName;
      dataError["brandName"] = null;
    });
  }
}
