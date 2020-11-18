part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignOutResult> signUp(String email, String password, String name,
  List<String> selectedGenres, String selectedLanguage) async {
    try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(
              email: email, password: password); 
          
            User user = result.user.convertToUser(
              name: name, 
              selectedGenres: selectedGenres, 
              selectedLanguage: selectedLanguage);  

            await UserServices.updateUser(user);  
            return SignInSignOutResult(user: user);
          } catch(e){
            return SignInSignOutResult(message: e.toString().split(',')[1]);
          }
        }
    
    static Future<SignInSignOutResult> signIn(
      String email, String password) async{
        try {
          AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

          User user = await result.user.fromFirestore();

          return SignInSignOutResult(user: user);
          } catch (e){
            return SignInSignOutResult(message: e.toString().split(',')[1]);
          }
      }  

    static Future<void> signOut() async{
      await _auth.signOut();
    }  

    static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged; 
}

class SignInSignOutResult{
  final User user;
  final String message;

  SignInSignOutResult({this.user, this.message});
}