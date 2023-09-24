
import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/res/components/round_button.dart';
import 'package:mvvm_starting_project/utils/Utils.dart';
// provider
import 'package:provider/provider.dart';
import 'package:mvvm_starting_project/utils/routes/routes_name.dart';
import 'package:mvvm_starting_project/view/home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  // state_management
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  // text_field_controller
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  // focus_node
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();




  // dispose_function
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();


    _passwordController.dispose();
    _emailController.dispose();
    _obsecurePassword.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

  }


  @override
  Widget build(BuildContext context) {

    // screen_height
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

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

              // focus_changing
              onFieldSubmitted: (nextFocusVal){

                // FocusScope.of(context).requestFocus(passwordFocusNode);

                // function_calling
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);


              },

            ),


            // password_form_field
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child){
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: '*', // new
                    focusNode: passwordFocusNode, // new

                    decoration:  InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outlined),

                        suffixIcon: InkWell(
                            onTap: (){
                              _obsecurePassword.value = !_obsecurePassword.value;
                            },
                            child: Icon(
                            _obsecurePassword.value ?  Icons.visibility_off_outlined : Icons.visibility
                            )
                        )


                    ),

                  );
                }
            ),


            // height
            SizedBox(
              height: height * 0.1,
            ),


            RoundButton(

                height: height * 0.05,
                title: 'Login',
                onPress: (){


                  // custom_condition_for_login
                  if(_emailController.text.isEmpty){
                    Utils.flushbarErrorMessage('Please enter email', context);

                  }else if(_passwordController.text.isEmpty){
                    Utils.flushbarErrorMessage('Please enter password', context);

                  }else if(_passwordController.text.length < 6){
                    Utils.flushbarErrorMessage('Please enter 6 digit password', context);

                  }else{
                    Utils.flushbarErrorMessage('Login Successful', context);
                  }

                },

            ),



          ],
        ),
      ),





    );
  }
}
