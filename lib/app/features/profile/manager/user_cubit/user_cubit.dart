import 'package:bloc/bloc.dart';
import 'package:e_commerce/app/features/auth/data/models/User_Model.dart';
import 'package:e_commerce/app/features/profile/data/user_repo/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.userRepo}) : super(UserInitial());
  UserRepo userRepo;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  String imageUrl = '';
  Future<void> getUserInfo() async {
    final user = await userRepo.getUserInfo();
    user.fold((l) {
      emit(GetUserInfoFailure(errMessage: l.errmessage));
    }, (r) {
      emit(GetUserInfoSuccess(userModel: r));
    });
  }

  Future<void> updateUserName() async {
    final user = await userRepo.updateUserName(name: nameController.text);
    user.fold((l) {
      emit(UpdateUserNameFailure(errMessage: l.errmessage));
    }, (r) {
      emit(UpdateUserNameSuccess());
    });
  }

  Future<void> updateUserPhoneNumber() async {
    final user =
        await userRepo.updateUserPhoneNumber(phoneNumber: phoneController.text);
    user.fold((l) {
      emit(UpdateUserPhoneNumberFailure(errMessage: l.errmessage));
    }, (r) {
      emit(UpdateUserPhoneNumberSuccess());
    });
  }

  Future<void> updateUserImage({required String imageUrl}) async {
    final user = await userRepo.updateUserProfileImage(imageUrl: imageUrl);
    user.fold((l) {
      emit(UpdateUserImageFailure(errMessage: l.errmessage));
    }, (r) {
      emit(UpdateUserImageSuccess());
    });
  }
}
