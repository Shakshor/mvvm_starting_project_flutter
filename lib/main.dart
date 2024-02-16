import 'package:flutter/material.dart';
import 'package:mvvm_starting_project/utils/routes/routes.dart';
import 'package:mvvm_starting_project/utils/routes/routes_name.dart';
import 'package:mvvm_starting_project/view/login_screen.dart';
import 'package:mvvm_starting_project/view_model/auth_view_model.dart';
import 'package:mvvm_starting_project/view_model/internal_req_view_model.dart';
import 'package:mvvm_starting_project/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [

          ChangeNotifierProvider(create: (_) => AuthViewModel() ),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
          ChangeNotifierProvider(create: (_) => InternalReqPendingViewModel()),

        ],

      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        /*-------------------------- routes declaration --------------------*/
        // home: const LoginScreen(),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
        /*---------------------------- routes declaration end ---------------------------------------*/
      ),
    );
  }
}

