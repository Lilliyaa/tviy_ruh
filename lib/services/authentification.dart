import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentification{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
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