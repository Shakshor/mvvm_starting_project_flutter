import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {



  // save_the_user_value
  Future<bool> saveUser (UserModel user) async {

    final SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }


  // get_the_user_value
  Future<UserModel> getUser () async {

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    return UserModel(
      token: token.toString()
    );
  }


  // remove_the_user
  Future<bool> removeUser() async {

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    sp.clear();

    return true;
  }







}