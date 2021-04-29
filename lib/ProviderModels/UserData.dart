import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserData  extends ChangeNotifier{
  Map _userData = {};
  Map get userData => _userData;
  Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();

  set userData(Map userDataParameter){
    _userData = userDataParameter;
    notifyListeners();
  }

  void checkIfUserDataOnMobileStorage(){

    _prefs.then((SharedPreferences prefs) {
      if( prefs.get("userData") == null ){
      } else{
        userData = jsonDecode(prefs.getString("userData")!);
      }

    });
  }

  void updateUserInfo(Map userNewInfo){
    userData = userNewInfo;
    _prefs.then((SharedPreferences prefs) {
      prefs.setString("userData" , jsonEncode(userNewInfo));
    });
  }

}