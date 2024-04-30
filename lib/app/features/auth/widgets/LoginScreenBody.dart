import 'package:e_commerce/app/features/auth/logic/manager/login_Cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/App_Image.dart';
import '../../../core/styles/text_Style.dart';
import '../../../core/widgets/CustomAuthHaveaccount.dart';
import '../../../core/widgets/HsizedBox.dart';
import '../../../core/widgets/VsizedBox.dart';
import '../../../core/widgets/customMainButton.dart';
import 'LoginForm.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var logCubit = BlocProvider.of<LoginCubit>(context);
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 40.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Sign In",
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
          const LoginForm(),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Recovery Password",
                  style: Txtstyle.style12(context: context).copyWith(
                    color: AppColors.kGreyColorB81,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
          const VsizedBox(height: 25),
          CustomMainButton(
            width: 375.w,
            fcolorWhite: true,
            txt: "Sign In",
            color: AppColors.kPrimaryColor,
            onPressed: () async {
              await logCubit.signInwithEmailandPassword(
                  email: logCubit.emailController.text,
                  password: logCubit.passController.text,
                  context: context);
            },
          ),
          const VsizedBox(height: 25),
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
          const VsizedBox(height: 80),
          CustomAuthHaveaccount(
            onTap: () {},
            accountType: "New User? ",
            createOrLogin: "Create Account",
          )
        ],
      )),
    ));
  }
}
