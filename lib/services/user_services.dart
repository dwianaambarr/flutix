part of 'services.dart';


class UserServices {
  static CollectionReference _userCollections =
  Firestore.instance.collection('users');

  static Future<void> updateUser(User user) async {
    String genres = "";

    for(var genre in user.selectedGenres){
      genres += genre + ((genre != user.selectedGenres.last) ? ',' : '');
    }

    _userCollections.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilPicture ?? ""

    });
  }
}