import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/app/core/styles/App_Colors.dart';
import 'package:e_commerce/app/core/styles/text_Style.dart';
import 'package:e_commerce/app/core/utils/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../upload_product/logic/manager/product_Cubit/product_cubit.dart';
import '../manager/user_cubit/user_cubit.dart';

BlocBuilder<ProductCubit, ProductState> changeProfileImageBlocBuilder(
    {required GetUserInfoSuccess userState}) {
  return BlocBuilder<ProductCubit, ProductState>(
    builder: (context, state) {
      if (state is ImageUploadedSuccsess) {
        GlobalVariable.imageUrl = state.imageUrl;
        
        return CircleAvatar(
          backgroundColor: AppColors.kPrimaryColor,
          radius: 60.r,
          backgroundImage: CachedNetworkImageProvider(state.imageUrl),
        );
      } else if (state is ImageUploadedFaliure) {
        return Text(
          state.errMessage,
          style: Txtstyle.style16(context: context).copyWith(),
        );
      } else if (state is ImageUploadedLoading) {
        CircleAvatar(
          backgroundColor: AppColors.kPrimaryColor,
          radius: 60.r,
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.kOfWhiteColor,
            ),
          ),
        );
      }
      return userState.userModel.imageUrl == ""
          ? CircleAvatar(
              backgroundColor: AppColors.kPrimaryColor,
              radius: 60.r,
            )
          : CircleAvatar(
              backgroundColor: AppColors.kPrimaryColor,
              radius: 60.r,
              backgroundImage:
                  CachedNetworkImageProvider(userState.userModel.imageUrl!),
            );
    },
  );
}
