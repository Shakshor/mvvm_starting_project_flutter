
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm_starting_project/data/app_exception.dart';
import 'package:mvvm_starting_project/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;




class NetWorkApiService extends BaseApiService{


  // get_get_api_response
  @override
  Future getGetApiResponse(String url) async {

    dynamic responseJson;

    try{

      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      //function calling and get the result
      responseJson = returnResponse(response);

    }
    // socketException means data connection problem
    on SocketException {
      throw FetchDataException('No Internet Connection');
    }


    return responseJson;

  }




  // get_post_api_response
  @override
  Future getPostApiResponse(String url, dynamic data) async {

    dynamic responseJson;

    try{

      Response response = await post(
        Uri.parse(url),
        body: data
      ).timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);

    }
    on SocketException{
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;


  }






  // return_result_according_to_status_code
  dynamic returnResponse (http.Response response){

    switch(response.statusCode){

      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnAuthorisedException(response.body.toString());

      case 500:

      default:
        throw FetchDataException('Error occurred while communicating with server with status conde ${response.statusCode.toString()}');

    }


  }



}