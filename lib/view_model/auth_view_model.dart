

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_starting_project/model/UserModel.dart';
import 'package:mvvm_starting_project/repository/auth_repository.dart';
import 'package:mvvm_starting_project/utils/Utils.dart';
import 'package:mvvm_starting_project/utils/routes/routes_name.dart';
import 'package:mvvm_starting_project/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel  extends ChangeNotifier{

  final _authRepo = AuthRepository();


  // login_loading
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) => {

    _loading = value,
    notifyListeners(),
  };


  // signUp_loading
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setSignUpLoading (bool value) => {
    _signUpLoading = value,
    notifyListeners(),
  };



  // login_method_handle
  Future<void> loginApi(dynamic data, BuildContext context) async {

    setLoading(true);

    _authRepo.loginApi(data).then((value)  {

      setLoading(false);

      // initialize_user_view_model(save_user)
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(
        UserModel(
          token: value['token'].toString(),
        )
      );

      Utils.flushbarErrorMessage('Login Successful', context);
      Navigator.pushNamed(context, RoutesName.home);

      if(kDebugMode){
        print(value.toString());
      }


      }
    ).onError((error, stackTrace) {

      setLoading(false);

      if(kDebugMode){
        print(error.toString());
        Utils.flushbarErrorMessage(error.toString(), context);
      }


    });

  }


  // sign_up_method
  Future<void> signUpApi(data, BuildContext context) async {

    setSignUpLoading(false);

    _authRepo.signUpApi(data).then((value) => {

      setSignUpLoading(true),

      Utils.flushbarErrorMessage('Sign Up Successful', context),

      Navigator.pushNamed(context, RoutesName.home),

      }
    ).onError((error, stackTrace) => {

      setSignUpLoading(false),

      Utils.flushbarErrorMessage(error.toString(), context)

    });

  }





}