
import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/utils/routes/routes_name.dart';
import 'package:mvvm_starting_project/view/home_screen.dart';
import 'package:mvvm_starting_project/view/login_screen.dart';
import 'package:mvvm_starting_project/view/sign_up_screen.dart';
import 'package:mvvm_starting_project/view/splash_screen.dart';


class Routes {


  static Route<dynamic> generateRoute(RouteSettings settings){

    // checking_with _route_name
    switch(settings.name){


    // home_screen
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());

        // home_screen
        case RoutesName.home:
          return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());

        // login_screen
        case RoutesName.login:
          return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());

        // signup_screen
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpScreen());

          // no_route_path
          default:
            return MaterialPageRoute(builder: (_){
              return const Scaffold(
                body: Center(
                  child: Text('No Route Found'),
                ),
              );
        });


    }


  }



}