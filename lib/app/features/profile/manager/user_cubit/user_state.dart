part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

class UpdateUserNameSuccess extends UserState {}

class UpdateUserNameFailure extends UserState {
  final String errMessage;

  UpdateUserNameFailure({required this.errMessage});
}

class UpdateUserPhoneNumberSuccess extends UserState {}

class UpdateUserPhoneNumberFailure extends UserState {
  final String errMessage;

  UpdateUserPhoneNumberFailure({required this.errMessage});
}

class UpdateUserImageSuccess extends UserState {}

class UpdateUserImageFailure extends UserState {
  final String errMessage;

  UpdateUserImageFailure({required this.errMessage});
}

class GetUserInfoFailure extends UserState {
  final String errMessage;
  GetUserInfoFailure({required this.errMessage});
}

class GetUserInfoSuccess extends UserState {
  final UserModel userModel;
  GetUserInfoSuccess({required this.userModel});
}
