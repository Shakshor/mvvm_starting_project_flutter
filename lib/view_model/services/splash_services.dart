import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/model/UserModel.dart';
import 'package:mvvm_starting_project/utils/routes/routes_name.dart';
import 'package:mvvm_starting_project/view_model/user_view_model.dart';

class SplashServices {


  // get_user_value_from_shared_pref
  // getter_method
  Future<UserModel> getUserData() => UserViewModel().getUser();


  // function_for_checking_authentication
  void checkAuthentication ( BuildContext context ) async {


    getUserData().then((value) async {

      print(value.token);

      if(value.token == 'null' || value.token == '') {

        await Future.delayed(Duration(seconds: 2));
        Navigator.pushNamed(context, RoutesName.login);

      }else{


        await Future.delayed(Duration(seconds: 2));
        Navigator.pushNamed(context, RoutesName.home);

      }


    }).onError((error, stackTrace) {

      //
      // if(kDebugMode){
      //   print(error.toString()),
      // }

    });

  }








}