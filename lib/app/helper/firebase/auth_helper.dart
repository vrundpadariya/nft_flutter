

import 'dart:developer';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:nftapp/header.dart';

import '../../views/login/model/loginmodel.dart';
import '../../views/signup/model/signupmodel.dart';




class AuthHelper {
  AuthHelper._();

  //todo:var
  static final AuthHelper authHelper = AuthHelper._();
  static FirebaseAuth auth = FirebaseAuth.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn();

  //todo: Anonymous login
  Future<Map<String, dynamic>> signInAnonymous() async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await auth.signInAnonymously();
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  //todo: SignUP With Email Pass
  Future<Map<String, dynamic>> signUp(
      {required SignUpModel signUpModel}) async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: signUpModel.email, password: signUpModel.password);
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  //todo:login with email password
  Future<Map<String, dynamic>> login({required LoginModel loginmodel}) async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: loginmodel.email,
        password: loginmodel.password,
      );
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  //todo: login with googleId
  Future<Map<String, dynamic>> signInWithGoogle() async {
    Map<String, dynamic> res = {};
    try {
      //
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      //
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      //
      final cradential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      //
      UserCredential userCredential =
      await auth.signInWithCredential(cradential);
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  //todo: Sign Out
  Future<void> signOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }
}

//todo: facebook login


Future<UserCredential> signInWithFacebook() async {
  try {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      final AccessToken? accessToken = loginResult.accessToken;

      if (accessToken == null) {
        throw FirebaseAuthException(
          code: 'ERROR_MISSING_ACCESS_TOKEN',
          message: 'Access token is null.',
        );
      }

      final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.tokenString);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_FACEBOOK_LOGIN_FAILED',
        message: 'The Facebook login was not successful.',
      );
    }
  } on FirebaseAuthException catch (e) {
    // Handle Firebase authentication exceptions

    log('Firebase Auth Exception: ${e.code} - ${e.message}');
    rethrow; // rethrow the exception
  } catch (e) {
    // Handle other exceptions
    log('Other Exception: $e');
    rethrow; // rethrow the exception
  }
}