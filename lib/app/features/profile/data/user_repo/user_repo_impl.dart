import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/app/core/errors/firebase_faliure.dart';
import 'package:e_commerce/app/features/auth/data/models/User_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/errors/faliure.dart';
import 'user_repo.dart';

class UserRepoImpl extends UserRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<Either<Faliures, String>> updateUserName(
      {required String name}) async {
    try {
      await firestore
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid)
          .update({"name": name});
      return right(name);
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Faliures, String>> updateUserPhoneNumber(
      {required String phoneNumber}) async {
    try {
      await firestore
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid)
          .update({"phoneNumber": phoneNumber});
      return right(phoneNumber);
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Faliures, String>> updateUserProfileImage(
      {required String imageUrl}) async {
    try {
      await firestore
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid)
          .update({"imageUrl": imageUrl});
      return right(imageUrl);
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Faliures, UserModel>> getUserInfo() async {
    try {
      final userModel = await firestore
          .collection("users")
          .doc(firebaseAuth.currentUser!.uid)
          .get();
      return right(UserModel.fromJcon(data: userModel.data()!));
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}
