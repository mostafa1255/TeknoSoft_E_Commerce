import 'package:e_commerce/app/core/widgets/HsizedBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/App_Image.dart';
import '../../../core/styles/text_Style.dart';
import '../../../core/widgets/CustomAuthHaveaccount.dart';
import '../../../core/widgets/VsizedBox.dart';
import '../../../core/widgets/customMainButton.dart';
import '../logic/manager/register_Cubit/register_cubit.dart';
import 'RegisterFormField.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var regCubit = BlocProvider.of<RegisterCubit>(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 40.h, left: 14.w, right: 14.w),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Create Account",
                style: Txtstyle.style32(context: context).copyWith(
                    color: AppColors.kFontColor, fontWeight: FontWeight.bold),
              ),
            ),
            const VsizedBox(height: 8),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 260.w,
                child: Text(
                  "Fill your details or continue with Google",
                  textAlign: TextAlign.center,
                  style: Txtstyle.style16(context: context)
                      .copyWith(color: AppColors.kGreyColorB81),
                ),
              ),
            ),
            const VsizedBox(height: 40),
            const RegisterFormField(),
            const VsizedBox(height: 20),
            CustomMainButton(
              width: 375.w,
              fcolorWhite: true,
              txt: "Sign Up",
              color: AppColors.kPrimaryColor,
              onPressed: () async {
                await regCubit.signUpwithEmailandPassword(
                    email: regCubit.emailController.text,
                    password: regCubit.passController.text,
                    name: regCubit.nameController.text,
                    phoneNumber: regCubit.phoneController.text);
              },
            ),
            const VsizedBox(height: 20),
            CustomMainButton(
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.iconGoogle),
                  const HsizedBox(width: 15),
                  Text(
                    "Sign In with Google ",
                    style: Txtstyle.style14(context: context)
                        .copyWith(color: AppColors.kFontColor),
                  )
                ],
              ),
              fcolorWhite: true,
              color: AppColors.kOfWhiteColor,
              onPressed: () {},
            ),
            const VsizedBox(height: 20),
            CustomAuthHaveaccount(
              onTap: () async {},
              accountType: "Already Have Account?",
              createOrLogin: " Log In",
            ),
            const VsizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}
