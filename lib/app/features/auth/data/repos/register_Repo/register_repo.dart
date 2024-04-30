import 'package:dartz/dartz.dart';
import 'package:e_commerce/app/core/errors/faliure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Registerrepo {
  Future<Either<Faliures, UserCredential>> signUpwithEmailandPassword({
    required String email,
    required String password,
  });
  Future<Either<Faliures, UserCredential>> signUpwithGoogle();
  Future<Either<Faliures, void>> sendUserInfotoFirestore(
      {required String name,
      required String email,
      required String userid,
      required String imageUrl,
      required String phoneNumber});
}
