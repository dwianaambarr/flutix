part of 'pages.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage>{
  @override
  // TODO: implement widget
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:  Text("Main Page"),),
      body: Center(
        child: Column(
          children: <Widget>[
            BlocBuilder<UserBloc, UserState>(
              builder: (_, userState) => (userState is UserLoaded) ? Text(userState.user.name) : SizedBox()),
            RaisedButton(
            child: Text("Sign Out"),
            onPressed: () {
              AuthServices.signOut();
            }),
          ],
        ),
        ),
      );
  }
}