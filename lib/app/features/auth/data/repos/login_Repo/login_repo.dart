import 'package:dartz/dartz.dart';
import 'package:e_commerce/app/core/errors/faliure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class LoginRepo {
  Future<Either<Faliures, UserCredential>> signInwithEmailandPassword({
    required String email,
    required String password,
    required BuildContext context,
  });
  Future<Either<Faliures, UserCredential>> signInwithGoogle();

  Future<Either<Faliures, void>> resetPassword({required String email});
}
