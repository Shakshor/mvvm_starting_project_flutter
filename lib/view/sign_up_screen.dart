import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/res/components/round_button.dart';
import 'package:mvvm_starting_project/utils/Utils.dart';
import 'package:mvvm_starting_project/utils/routes/routes_name.dart';
import 'package:mvvm_starting_project/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


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

    // provider/view_model declare
    final authViewModel = Provider.of<AuthViewModel>(context);

    // screen_height
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return Scaffold(


      appBar: AppBar(

        title: const Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),


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

              loading: authViewModel.loading,
              height: height * 0.05,
              title: 'Sign Up',
              onPress: (){


                // custom_condition_for_login
                if(_emailController.text.isEmpty){
                  Utils.flushbarErrorMessage('Please enter email', context);

                }else if(_passwordController.text.isEmpty){
                  Utils.flushbarErrorMessage('Please enter password', context);

                }else if(_passwordController.text.length < 6){
                  Utils.flushbarErrorMessage('Please enter 6 digit password', context);

                }else{

                  Map data = {
                    "email": _emailController.text.toString(),
                    "password": _passwordController.text.toString(),
                  };

                  authViewModel.signUpApi(data, context);

                  print('SignUp api hit sucessfully');
                }

              },

            ),

            // height
            SizedBox(
              height: height * 0.03,
            ),

            InkWell(
                onTap: (){

                  Navigator.pushNamed(context, RoutesName.login);

                },
                child: const Text("Already have an account? Login")
            ),


          ],
        ),
      ),





    );
  }



}
