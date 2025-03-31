import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;

  register(String email, String password, String name) async {
    try {
      final user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await auth.currentUser!.updateDisplayName(name);
      return user;
    } catch (e) {
      return Future.error(e);
    }
  }

  login(String email, String password) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      return Future.error(e);
    }
  }

  signout() async {
    try {
      await auth.signOut();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
