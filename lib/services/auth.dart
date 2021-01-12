import 'package:brew_crew/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Authserviceはauthに関連したサービスを司る、ここを全てのページで最初に定義し、中身のクラスを持ってくる
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user based on firebase
  //user.dartで定義したuidを引っ張ってくる
  BrewCrewUser _userFromFirebase(User user) {
    return user != null ? BrewCrewUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<BrewCrewUser> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password

  //register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
