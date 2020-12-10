import 'package:flutix/bloc/bloc.dart';
import 'package:flutix/services/services.dart';
import 'package:flutix/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
           value: AuthServices.userStream,
           child: MultiBlocProvider(
             providers: [
               BlocProvider(create: (_) => PageBloc()),
               BlocProvider(create: (_) => UserBloc())
             ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper()

        ),
           ),
    );
  }
}


        // home: Scaffold(
        //   body: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         RaisedButton(child: Text("Sign Up"), onPressed: () async {
        //           SignInSignOutResult result = await AuthServices.signUp(
        //             "ambar@gmail.com", 
        //             "Ambar12345", 
        //             "ambar", 
        //             ["Horror", "Action"], 
        //             "English");

        //             if(result.user == null){
        //               print (result.message);
        //             } else{
        //               print(result.user.toString());
        //             }
        //         }),
        //         RaisedButton(child: Text("Sign In"), onPressed: () async {
        //           SignInSignOutResult result = await AuthServices.signIn(
        //             "ambar@gmail.com", 
        //             "Ambar123457");

        //             if(result.user == null){
        //               print (result.message);
        //             } else{
        //               print(result.user.toString());
        //             }
        //         }) 
        //       ], 
        //     ), 
        //   )), 