
import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/utils/Utils.dart';
import 'package:mvvm_starting_project/utils/routes/routes_name.dart';
import 'package:mvvm_starting_project/view/home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
          child: InkWell(
              onTap: ( ){
                
                
                // Utils.toastMessage('No internet connection');
                
                // Utils.flushbarErrorMessage('Show Error Message', context);

                Utils.snackBar('show message sniper', context);
                
                
                
                // Navigator.pushNamed(context, RoutesName.home);
                //
                // // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()))
              },
              child: const Text('Show Message'),
          )
      ),

    );
  }
}
