import 'package:flutix/services/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(child: Text("Sign Up"), onPressed: () async {
                SignInSignOutResult result = await AuthServices.signUp(
                  "ambar@gmail.com", 
                  "Ambar12345", 
                  "ambar", 
                  ["Horror", "Action"], 
                  "English");

                  if(result.user == null){
                    print (result.message);
                  } else{
                    print(result.user.toString());
                  }
              }),
              RaisedButton(child: Text("Sign In"), onPressed: () async {
                SignInSignOutResult result = await AuthServices.signIn(
                  "ambar@gmail.com", 
                  "Ambar123457");

                  if(result.user == null){
                    print (result.message);
                  } else{
                    print(result.user.toString());
                  }
              }) 
            ], 
          ), 
        )), 
      );
  }
}