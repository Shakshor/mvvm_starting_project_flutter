
import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/data/response/api_response.dart';
import 'package:mvvm_starting_project/model/user_details_model.dart';
import 'package:mvvm_starting_project/repository/home_repository.dart';
import 'package:mvvm_starting_project/utils/Utils.dart';

class HomeViewModel with ChangeNotifier{


  final homeRepo = HomeRepository();

  // response_handling
  ApiResponse<List<UserDetailsModel>> usersList = ApiResponse.loading();
  

  // set_response_status
  setUserDetailsList(ApiResponse<List<UserDetailsModel>> response){

    usersList = response;
    notifyListeners();

  }



  Future<void> fetchUserDetails(BuildContext context) async {

    // initial_loading_state
    setUserDetailsList(ApiResponse.loading());
    
    
    homeRepo.fetchUserDetails().then((value) {
      
      // print(value);

      setUserDetailsList(ApiResponse.completed(value));
      
    }).onError((error, stackTrace) {
      
      setUserDetailsList(ApiResponse.error(error.toString()));

      // Utils.flushbarErrorMessage(error.toString(), context);
      
      
    });
    
  }







}