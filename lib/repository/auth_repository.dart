

import 'package:mvvm_starting_project/data/network/BaseApiServices.dart';
import 'package:mvvm_starting_project/data/network/NetworkApiService.dart';
import 'package:mvvm_starting_project/res/app_url.dart';

class AuthRepository {


  BaseApiService _apiServices = NetWorkApiService();
  
  
  // login_api
  Future<dynamic>  loginApi(dynamic data) async {
    
    try{
      
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
      
    }catch(e){
      
     throw e.toString();

    }
    
  }


  // registration_api
  Future<dynamic>  registerApi(dynamic data) async {

    try{

      dynamic response = _apiServices.getPostApiResponse(AppUrl.registrationUrl, data);
      return response;

    }catch(e){

      throw e.toString();

    }

  }
  
  


}