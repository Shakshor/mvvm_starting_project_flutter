// importing file
import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/data/response/api_response.dart';
import 'package:mvvm_starting_project/model/InternalRequisitionModel.dart';
import 'package:mvvm_starting_project/repository/internal_req_repository.dart';




class InternalReqPendingViewModel extends ChangeNotifier {

  // initialize_repository
  final internalReqRepo = InternalReqPendingRepo();

  // initialize_response_status
  ApiResponse<InternalRequisitionModel> internalReqPendingList = ApiResponse.loading();

  // set_the_network_response_status
  setInternalReqPendingList(ApiResponse<InternalRequisitionModel> response){
    debugPrint('inside_int_req_pending_view_model');
    print(response.data?.items?.length.toString() ?? 0);
    internalReqPendingList = response;
    notifyListeners();
  }

  // pending_method
  Future<void> fetchInternalReqPendingList() async {
    // loading
    setInternalReqPendingList(ApiResponse.loading());
    // calling_fetch_method_from_repository
    internalReqRepo.fetchInternalReqPendingList().then((value) {
      // completed
      setInternalReqPendingList(ApiResponse.completed(value));
      notifyListeners();
    }).onError((error, stackTrace) {
      // error
     setInternalReqPendingList(ApiResponse.error(error.toString()));
      notifyListeners();
    });

  }
}