import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/data/response/status.dart';
import 'package:mvvm_starting_project/utils/routes/routes_name.dart';
import 'package:mvvm_starting_project/view_model/home_view_model.dart';
import 'package:mvvm_starting_project/view_model/internal_req_view_model.dart';
import 'package:mvvm_starting_project/view_model/user_view_model.dart';
import 'package:provider/provider.dart';


class InternalReqPendingScreen extends StatefulWidget {
  const InternalReqPendingScreen({super.key});

  @override
  State<InternalReqPendingScreen> createState() => _InternalReqPendingScreenState();
}

class _InternalReqPendingScreenState extends State<InternalReqPendingScreen> {


  // view_model_calling_only_runtime
  // HomeViewModel homeViewModel = HomeViewModel();
  InternalReqPendingViewModel interReqPendViewModel = InternalReqPendingViewModel();


  @override
  void initState() {
    // TODO: implement initState
    // homeViewModel.fetchUserDetails(context);
    interReqPendViewModel.fetchInternalReqPendingList();

    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(

        title: const Text('Internal Req Pending Screen'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,

      ),

      body: ChangeNotifierProvider<InternalReqPendingViewModel>(

        create: (BuildContext context) => interReqPendViewModel,
        child: Consumer<InternalReqPendingViewModel>(
          builder: (context, value, child) {

            switch(value.internalReqPendingList.status!){

              case Status.LOADING:
                return Center(child: const CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.internalReqPendingList.message.toString()));

              case Status.COMPLETED:

                var intPendListData= value.internalReqPendingList.data!.items!;

                return ListView.builder(
                    itemCount: intPendListData.length,
                    itemBuilder: (context, index){
                      return Card(

                        child: ListTile(
                          title: Text(intPendListData[index].categoryName.toString()),
                          subtitle: Text(intPendListData[index].actionBy.toString()),
                        ),

                      );
                    }
                );
            }

            return Container();
          },
        ),

      ),



    );
  }
}
