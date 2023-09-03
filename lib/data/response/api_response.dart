

import 'package:mvvm_starting_project/data/response/status.dart';

class ApiResponse<T> {

  Status? status;
  T? data;
  String? message;

  // constructor
  ApiResponse(this.status, this.data, this.message);


  // named constructor
  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed() : status = Status.COMPLETED;

  ApiResponse.error() : status = Status.ERROR;


  @override
  String toString(){
    return "Status: $status \n Message: $message Data: $data";
  }



}