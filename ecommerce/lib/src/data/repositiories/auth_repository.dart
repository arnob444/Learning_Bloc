import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/src/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();

      if (googleSignIn == null) return null;

      final googleAuth = await googleSignIn.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final authResult = await _auth.signInWithCredential(credential);

      if (authResult.user != null) {
        await createUserInDataBase(authResult.user!);
      }

      return authResult.user;
    } catch (e) {
      debugPrint("Google sign-in error: $e");
      return null;
    }
  }

  Future<User?> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();

      if (result.status != LoginStatus.success) return null;

      final credential = FacebookAuthProvider.credential(
        result.accessToken!.tokenString,
      );

      final authResult = await _auth.signInWithCredential(credential);

      if (authResult.user != null) {
        await createUserInDataBase(authResult.user!);
      }

      return authResult.user;
    } catch (e) {
      debugPrint("Facebook sign-in error: $e");
      return null;
    }
  }

  Future<User?> signInWithTwitter() async {
    try {
      final twitterProvider = TwitterAuthProvider();

      final userCredential = await _auth.signInWithProvider(twitterProvider);

      if (userCredential.user != null) {
        await createUserInDataBase(userCredential.user!);
      }

      return userCredential.user;
    } catch (e) {
      debugPrint("Twitter sign-in error: $e");
      return null;
    }
  }

  Future<void> createUserInDataBase(User user) async {
    debugPrint("createUserInDataBase CALLED");
    debugPrint("UID: ${user.uid}");

    final data = UserModel(
      userName: user.displayName,
      email: user.email,
      photoUrl: user.photoURL,
      phoneNumber: user.phoneNumber,
    );

    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(data.toJson())
          .then((value) {
            debugPrint("✅ Firestore write SUCCESS");
          });
    } catch (e, s) {
      debugPrint("Firestore write FAILED: $e");
      debugPrint(s.toString());
    }
  }

  // Future<User?> signInWithTwitter() async {
  //   try {
  //     final TwitterLogin twitterLogin = TwitterLogin(
  //       apiKey: TWITTER_API_KEY,
  //       apiSecretKey: TWITTER_SECRET_KEY,
  //       redirectURI: 'bloc_ecommerce://',
  //     );
  //     final result = await twitterLogin.loginV2();
  //     debugPrint('Twitter login status: ${result.user?.name}');

  //     if (result.status == TwitterLoginStatus.loggedIn) {
  //       final credential = TwitterAuthProvider.credential(
  //         accessToken: result.authToken!,
  //         secret: result.authTokenSecret!,
  //       );
  //       final UserCredential authResult = await _auth.signInWithCredential(
  //         credential,
  //       );
  //       debugPrint('Twitter login success: ${authResult.user?.displayName}');
  //       return authResult.user;
  //     } else {
  //       debugPrint("Facebook login failed: ${result.errorMessage}");
  //       return null;
  //     }
  //   } catch (e) {
  //     debugPrint("Facebook login failed: ${e.toString()}");
  //     throw Exception(e);
  //   }
  // }
}
