import 'dart:convert';

import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:elmolad_dashboard/Functions/uploadImage.dart';
import 'package:elmolad_dashboard/ProviderModels/CategoryAndBrandImportantInfo.dart';
import 'package:elmolad_dashboard/ProviderModels/UserData.dart';
import 'package:elmolad_dashboard/Screens/AddSubProductsScreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:objectid/objectid.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AddMainProductScreenState {
  final state;

  AddMainProductScreenState(this.state);

  onSubmitFunc() async {
    UserData userData =
        Provider.of<UserData>(this.state.context, listen: false);
        this.state.data["storeid"] = userData.userData["storeid"];
    print("MainProductAdd");
    print("'Authorization' : 'Bearer ${userData.userData["access_token"]}'");
    if (check() && checkIfOfferPercentageIsDouble()) {
      loadingAlert();
      CategoryAndBrandImportantInfo importantInfo =
          Provider.of<CategoryAndBrandImportantInfo>(this.state.context,
              listen: false);
      importantInfo.brandList.forEach((element) {
        if (this.state.brandValue == element["brandName"]) {
          this.state.data["brandsId"] = element["Id"];
        }
      });

      importantInfo.categoryMap.forEach((key, value) {
        if (key == this.state.data["Gender"].toString()) {
          value.forEach((element) {
            if (this.state.categoryValue == element["categoryName"]) {
              this.state.data["categoryId"] = element["id"];
            }
          });
        }
      });
      print(this.state.data);
      var response = await http.post(Uri.parse('$serverURL/api/Product/AddMinProduct'),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ${userData.userData["access_token"]}'
              },
              body: jsonEncode(this.state.data));

      print(response.statusCode);
      print(response.body);
      if (response.statusCode < 300) {
        Navigator.of(this.state.context).pop();
        Navigator.of(this.state.context).push(MaterialPageRoute(
            builder: (context) => AddSubProductsScreen(response.body)));
      } else {
        Navigator.of(this.state.context).pop();
      }
    }
  }

  checkIfOfferPercentageIsDouble() {
    bool check = true;
    try {
      double.parse(this.state.data["productOfferPercentage"]);
      print(double.parse(this.state.data["productOfferPercentage"]));
    } catch (error) {
      print(error);
      check = false;
      this.state.setState(() {
        this.state.dataError["productOfferPercentage"] =
            "make sure this field is number";
      });
    }

    return check;
  }

  onChange(value, variableName) {
    this.state.setState(() {
      this.state.data[variableName] = value;
      this.state.dataError[variableName] = null;
    });
  }

  checkChange(value, variableName) {
    this.state.setState(() {
      this.state.data[variableName] = value;
    });
  }

  dropDownTextChange(value) {
    this.state.setState(() {
      this.state.brandValue = value;
    });
  }

  categoryListChange(value) {
    this.state.setState(() {
      this.state.categoryValue = value;
    });
  }

  searchFunction(value) {
    List<String> filter = [];
    CategoryAndBrandImportantInfo importantInfo =
        Provider.of<CategoryAndBrandImportantInfo>(this.state.context,
            listen: false);
    importantInfo.brandName.forEach((element) {
      if (element.length < value.length) {
      } else {
        if (element.substring(0, value.length).toLowerCase() ==
            value.toLowerCase()) {
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

  loadAssets() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result != null) {
      ScaffoldMessenger.of(this.state.context)
          .showSnackBar(SnackBar(content: Text("wait till image be uploaded")));
      result.files.forEach((element) async {
        final id = ObjectId();
        http.StreamedResponse response = await uploadImages(
            element.bytes!.buffer.asUint8List(),
            "image${id.hexString}.${element.extension}");
        if (response.statusCode < 300) {
          response.stream.transform(utf8.decoder).listen((value) {
            Map body = jsonDecode(value);
            this.state.setState(() {
              this.state.data["bestSellerImg"] = body["imgName"][0];
              this.state.dataError["bestSellerImg"] = null;
              print(this.state.data["bestSellerImg"]);
              ScaffoldMessenger.of(this.state.context).showSnackBar(SnackBar(
                content: Text("image has been uploaded"),
                backgroundColor: Colors.green,
              ));
            });
          });
        } else {
          ScaffoldMessenger.of(this.state.context).showSnackBar(SnackBar(
            content: Text("image has not been uploaded"),
            backgroundColor: Colors.red,
          ));
        }
      });
    } else {
      // User canceled the picker
    }
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
