

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_starting_project/repository/auth_repository.dart';
import 'package:mvvm_starting_project/utils/Utils.dart';
import 'package:mvvm_starting_project/utils/routes/routes_name.dart';

class AuthViewModel  extends ChangeNotifier{

  final _authRepo = AuthRepository();


  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) => {

    _loading = value,
    notifyListeners(),
  };



  // login_method_handle
  Future<void> loginApi(dynamic data, BuildContext context) async {

    setLoading(true);

    _authRepo.loginApi(data).then((value) => {

      setLoading(false),
      Utils.flushbarErrorMessage('Login Successful', context),

      Navigator.pushNamed(context, RoutesName.home),

      if(kDebugMode){
        print(value.toString()),
      }


      }
    ).onError((error, stackTrace) => {

      setLoading(false),

      if(kDebugMode){
        print(error.toString()),
        Utils.flushbarErrorMessage(error.toString(), context),
      }


    });

  }



}