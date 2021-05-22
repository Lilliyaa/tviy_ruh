import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentification{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> signInWithGoogle() async {
    User user;
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if(googleUser != null){
      final googlAuth = await googleUser.authentication;
      if(googlAuth.idToken != null){
        final userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googlAuth.idToken, accessToken: googlAuth.accessToken,
          ),
        );
        return userCredential.user;
      }
    } else {
      throw FirebaseAuthException(
        message: "Sign in aborder by user",
        code: "ERROR_ABORDER_BY_USER",
      );
    }
  }

  Future<List> createUserWithEmail(String _email, String _password) async {
    User user;
    String error;
    try {
      user = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      )).user;
    } on FirebaseAuthException catch(e){
      error = e.message;
    };
    return [user, error];
  }

  Future<List> signInWithEmail(String _email, String _password) async {
    User user;
    String error;
    try {
      user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      )).user;
    } on FirebaseAuthException catch(e){
      error = e.message;
    };
    return [user, error];
  }

  Future<void> signInWithFacebook() async {
    final FacebookLogin facebookSignIn = new FacebookLogin();

    final FacebookLoginResult result =
    await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');

        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  Future <void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  Future<void> signInAnonim() async
  {
    UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
  }
}