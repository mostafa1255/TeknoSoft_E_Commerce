import 'package:dartz/dartz.dart';
import 'package:e_commerce/app/core/errors/faliure.dart';
import 'package:e_commerce/app/features/auth/data/models/User_Model.dart';

abstract class UserRepo {
  Future<Either<Faliures, String>> updateUserName({required String name});
  Future<Either<Faliures, String>> updateUserPhoneNumber(
      {required String phoneNumber});
  Future<Either<Faliures, String>> updateUserProfileImage(
      {required String imageUrl});

  Future<Either<Faliures, UserModel>> getUserInfo();
}
