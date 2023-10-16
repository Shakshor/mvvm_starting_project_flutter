import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/data/response/status.dart';
import 'package:mvvm_starting_project/utils/routes/routes_name.dart';
import 'package:mvvm_starting_project/view_model/home_view_model.dart';
import 'package:mvvm_starting_project/view_model/user_view_model.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  // view_model_calling_only_runtime
  HomeViewModel homeViewModel = HomeViewModel();


  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.fetchUserDetails(context);

    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    // user_preference/ user_view_model_initialize
    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(

        title: const Text('Home Screen'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,

        actions: [

          InkWell(

              onTap: (){

                userPreference.removeUser().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                }
                );
              },

              child: const Center(child: Text('Logout'))
          ),


          SizedBox(width: 20,),

        ],

      ),

      body: ChangeNotifierProvider<HomeViewModel>(

        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) {

            switch(value.usersList.status!){

              case Status.LOADING:
                return Center(child: const CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.usersList.message.toString()));

              case Status.COMPLETED:

                var userListData = value.usersList.data!;

                return ListView.builder(
                    itemCount: userListData.length!,
                    itemBuilder: (context, index){
                      return Card(

                        child: ListTile(
                          title: Text(userListData[index].name!),
                          subtitle: Text(userListData[index].username!),
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
