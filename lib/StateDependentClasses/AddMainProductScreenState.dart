import 'package:elmolad_dashboard/Screens/AddSubProductsScreen.dart';
import 'package:flutter/material.dart';

class AddMainProductScreenState {
  final state, context;

  AddMainProductScreenState(this.state, this.context);

  onSubmitFunc() {
    if(check()){
      loadingAlert();
      print(this.state.data);
      Navigator.of(context).popAndPushNamed(AddSubProductsScreen.routeName);
    }
  }

  onChange(value, variableName) {
    print(value);
    print(variableName);
    this.state.setState(() {
      this.state.data[variableName] = value;
      this.state.dataError[variableName] = null;
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
      context: context,
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
