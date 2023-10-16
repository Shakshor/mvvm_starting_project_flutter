
import 'package:mvvm_starting_project/data/network/BaseApiServices.dart';
import 'package:mvvm_starting_project/data/network/NetworkApiService.dart';
import 'package:mvvm_starting_project/model/user_details_model.dart';
import 'package:mvvm_starting_project/res/app_url.dart';

class HomeRepository {


  final BaseApiService _apiService = NetWorkApiService();

  Future<List<UserDetailsModel>> fetchUserDetails() async {

    try {

      List<dynamic> response = await _apiService.getGetApiResponse(AppUrl.userDetailsUrl);

      List<UserDetailsModel> userDetailsList = response.map((user) => UserDetailsModel.fromJson(user)).toList();

      return userDetailsList;

    }catch(e){
      throw e;
    }


  }





}

