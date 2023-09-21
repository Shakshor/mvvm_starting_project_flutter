
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


  // text_field_controller
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  // focus_node
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(

        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),


      // body: Center(
      //     child: InkWell(
      //         onTap: ( ){
      //
      //
      //           // Utils.toastMessage('No internet connection');
      //
      //           // Utils.flushbarErrorMessage('Show Error Message', context);
      //
      //           Utils.snackBar('show message sniper', context);
      //
      //
      //
      //           // Navigator.pushNamed(context, RoutesName.home);
      //           //
      //           // // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()))
      //         },
      //         child: const Text('Show Message'),
      //     )
      // ),



      body: SafeArea(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            // email_form_field
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress, // new
              focusNode: emailFocusNode, // new

              decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined)
              ),

              onFieldSubmitted: (nextFocusVal){

                // FocusScope.of(context).requestFocus(passwordFocusNode);

                // function_calling
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);


              },

            ),


            // password_form_field
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              obscuringCharacter: '*', // new
              focusNode: passwordFocusNode, // new

              decoration: const InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outlined),
                  suffixIcon: Icon(Icons.visibility_off_outlined)
              ),

            ),

          ],
        ),
      ),





    );
  }
}
