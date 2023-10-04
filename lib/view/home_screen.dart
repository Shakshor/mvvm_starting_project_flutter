import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/utils/routes/routes_name.dart';
import 'package:mvvm_starting_project/view_model/user_view_model.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {






  @override
  Widget build(BuildContext context) {

    // user_preference/ user_view_model_initialize
    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(

        title: Text('Home Screen'),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,

        actions: [

          InkWell(

              onTap: (){

                userPreference.removeUser().then((value)
                {
                  Navigator.pushNamed(context, RoutesName.login);
                }
                );
              },

              child: Center(child: Text('Logout'))
          ),


          SizedBox(width: 20,),

        ],

      ),

    /*  body: SafeArea(

        child: Column(
          children: [



          ],
        ),
      ),*/



    );
  }
}
