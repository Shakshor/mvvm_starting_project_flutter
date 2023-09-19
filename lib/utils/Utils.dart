
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  // toast_message method
  static toastMessage(message){

    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        textColor: Colors.white,
    );
  }


  /*------------- flushbar_error_message --------------*/
  static void flushbarErrorMessage(String message, BuildContext context){

    showFlushbar(
        context: context,
        flushbar: Flushbar(

          message: message,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          borderRadius: BorderRadius.circular(8.0),
          backgroundColor: Colors.red,
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          duration: const Duration(seconds: 2),
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          icon: const Icon(Icons.error, size: 28, color: Colors.white,),

        )..show(context)
    );

  }
  
  
  /*----------------- show_snackbar ---------------------------*/
  
  static snackBar(String message, BuildContext context){
    
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message),
        backgroundColor: Colors.red,
      ),

    );
    
  }
  
  
  





}