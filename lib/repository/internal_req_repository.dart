// importing file
import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/data/network/BaseApiServices.dart';
import 'package:mvvm_starting_project/data/network/NetworkApiService.dart';
import 'package:mvvm_starting_project/model/InternalRequisitionModel.dart';



class InternalReqPendingRepo {


  Future<InternalRequisitionModel> fetchInternalReqPendingList() async {

    // dependency_object
    final BaseApiService apiService = NetWorkApiService();

    try {

      // dependency_object_function
      dynamic response = await apiService.getGetApiResponse('http://erp.hameemgroup.com/ords/xact_erp/approval/ir_pending_list?g_user_id=13');

      // // get_the_response_list & get_the_item_using_map
      // List<dynamic> responseList = response['items'];
      // List<InternalRequisitionModel> internalReqList = responseList.map((item) => InternalRequisitionModel.fromJson(item) ).toList();
      // debugPrint('internal_req_pending_repo_res: $internalReqList');
      //
      // return internalReqList;

      print('internal_req_pending_repo_res: ${response['items']}');
      return InternalRequisitionModel.fromJson(response);

    }
    catch(e){
      debugPrint('internal_req_pending_repo_error: ${e.toString()}');
      throw e.toString();
    }
  }
}