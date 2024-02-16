import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/view_model/services/splash_services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // creating_object
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // authentication_checking
    splashServices.checkAuthentication(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Splash Screen', style: Theme.of(context).textTheme.headlineLarge,),
        ),
      ),
    );
  }
}
