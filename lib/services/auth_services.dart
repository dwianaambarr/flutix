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
            return SignInSignOutResult(message: e.toString());
          }
        }
}

class SignInSignOutResult{
  final User user;
  final String message;

  SignInSignOutResult({this.user, this.message});
}