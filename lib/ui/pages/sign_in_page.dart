part of 'pages.dart';

class SignInPage extends StatefulWidget{
  @override
  _SignInPageState createState() => _SignInPageState();

}

class _SignInPageState extends State<SignInPage>{
  @override
  // TODO: implement widget
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:  Text("Sign In Page"),),
      body: Center(
        child: RaisedButton(
          child: Text("Sign In"),
          onPressed: () {
            AuthServices.signIn("dwi@gmail.com", "Ambar12345");
          }),
        ),
      );
  }
}