import 'package:e_commerce/app/features/auth/logic/manager/login_Cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import '../../../core/tools/App_Regex.dart';
import '../../../core/utils/global_keys.dart';
import '../../../core/widgets/CustomTextFormField.dart';
import '../../../core/widgets/SecurePasswordTextField.dart';
import '../../../core/widgets/VsizedBox.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    var logCubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: GlobalKeys.riKey1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email Address",
            style: Txtstyle.style16(context: context).copyWith(
              color: AppColors.kFontColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const VsizedBox(height: 8),
          CustomTextFormField(
            stringController: logCubit.emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return "Please enter your correct Email";
              }
            },
            hinttext: "Ex: xyz@gmail.com",
            securPass: false,
            width: double.infinity,
            height: 80.h,
          ),
          const VsizedBox(height: 12),
          Text(
            "Password",
            style: Txtstyle.style16(context: context).copyWith(
              color: AppColors.kFontColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const VsizedBox(height: 8),
          SecurePasswordTextField(
              passController: logCubit.passController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter correct Password";
                } else {
                  return null;
                }
              })
        ],
      ),
    );
  }
}
