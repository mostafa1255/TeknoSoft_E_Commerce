import 'package:e_commerce/app/core/utils/global_variable.dart';
import 'package:e_commerce/app/core/widgets/CustomTextFormField.dart';
import 'package:e_commerce/app/core/widgets/customMainButton.dart';
import 'package:e_commerce/app/features/profile/manager/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/functions/changePhotoBottomSheet.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import '../../../core/widgets/VsizedBox.dart';
import '../../upload_product/logic/manager/product_Cubit/product_cubit.dart';
import 'changeProfileImageBlocBuilder.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var userCubit = BlocProvider.of<UserCubit>(context)..getUserInfo();
    var productCubit = BlocProvider.of<ProductCubit>(context);
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is GetUserInfoSuccess) {
            var userState = state;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      changeProfileImageBlocBuilder(userState: userState),
                      const VsizedBox(height: 10),
                      Text(
                        state.userModel.name!,
                        style: Txtstyle.style20(context: context).copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.kFontColor,
                        ),
                      ),
                      const VsizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          changePhotoBottomSheet(
                            context: context,
                            onPressed2: () => productCubit
                                .getImageFromCameraAndUploadtoStorage(),
                            onPressed3: () => productCubit
                                .getImageFromGalleryAndUploadtoStorage(),
                          );
                        },
                        child: Text(
                          "Change Profile Picture",
                          style: Txtstyle.style12(context: context).copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const VsizedBox(height: 30),
                Text(
                  "Your Name",
                  style: Txtstyle.style16(context: context).copyWith(
                    color: AppColors.kGreyColorB81,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const VsizedBox(height: 8),
                CustomTextFormField(
                  hinttext: state.userModel.name,
                  stringController: userCubit.nameController,
                  fontcolor: AppColors.kFontColor,
                  securPass: false,
                  width: double.infinity,
                  height: 80.h,
                ),
                const VsizedBox(height: 12),
                Text(
                  "Email Address",
                  style: Txtstyle.style16(context: context).copyWith(
                    color: AppColors.kGreyColorB81,
                  ),
                ),
                const VsizedBox(height: 8),
                CustomTextFormField(
                  enableWriting: false,
                  initialValue: state.userModel.email,
                  fontcolor: AppColors.kFontColor,
                  securPass: false,
                  width: double.infinity,
                  height: 80.h,
                ),
                const VsizedBox(height: 12),
                Text(
                  "Mobile Number",
                  style: Txtstyle.style16(context: context).copyWith(
                    color: AppColors.kGreyColorB81,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const VsizedBox(height: 8),
                CustomTextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  stringController: userCubit.phoneController,
                  hinttext: state.userModel.phoneNumber.toString(),
                  securPass: false,
                  fontcolor: AppColors.kFontColor,
                  width: double.infinity,
                  height: 80.h,
                ),
                const VsizedBox(height: 8),
                CustomMainButton(
                  color: AppColors.kPrimaryColor,
                  fcolorWhite: true,
                  width: 375.w,
                  txt: "Save Now",
                  onPressed: () async {
                    Navigator.pop(context);
                    await userCubit.updateUserPhoneNumber();
                    await userCubit.updateUserName();
                    GlobalVariable.imageUrl == ""
                        ? null
                        : await userCubit.updateUserImage(
                            imageUrl: GlobalVariable.imageUrl);
                  },
                ),
              ],
            );
          } else if (state is GetUserInfoFailure) {
            return Center(
                child: Text(
              state.errMessage,
              style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kGreyColorB81,
                fontWeight: FontWeight.w500,
              ),
            ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )),
    ));
  }
}
