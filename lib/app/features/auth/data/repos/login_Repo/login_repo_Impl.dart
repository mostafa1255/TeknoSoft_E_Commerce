// ignore_for_file: use_build_context_synchronously
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../../core/errors/firebase_faliure.dart';
import 'login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<Either<Faliures, UserCredential>> signInwithEmailandPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      print("in Login function");
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(userCredential.user?.uid);
      if (auth.currentUser!.emailVerified) {
        return right(userCredential);
      } else {
        return left(FirebaseFailure.fromFirebaseError(
            errorCode: "Email Not Verified , Please Verify Email"));
      }
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
      } else {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliures, UserCredential>> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        await googleSignIn.disconnect();
        return left(FirebaseFailure.fromFirebaseError(errorCode: "ACCOUNT"));
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final isNewUser = userCredential.additionalUserInfo!.isNewUser;
      if (isNewUser) {
        await googleSignIn.disconnect();
        return left(FirebaseFailure.fromFirebaseError(
            errorCode: "You are not registered. Go to the register page."));
      } else {
        return right(userCredential);
      }
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    } on Exception catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
    }
  }

// reset password
  @override
  Future<Either<Faliures, void>> resetPassword({required String email}) async {
    try {
      if (email != "") {
        return right(await auth.sendPasswordResetEmail(email: email));
      }
      return left(
          FirebaseFailure.fromFirebaseError(errorCode: "Email is empty"));
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
      } else {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
      }
    }
  }
}
