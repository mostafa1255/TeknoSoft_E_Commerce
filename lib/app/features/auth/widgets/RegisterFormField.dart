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
import '../logic/manager/register_Cubit/register_cubit.dart';

class RegisterFormField extends StatefulWidget {
  const RegisterFormField({super.key});

  @override
  State<RegisterFormField> createState() => _RegisterFormFieldState();
}

class _RegisterFormFieldState extends State<RegisterFormField> {
  @override
  Widget build(BuildContext context) {
    var regCubit = BlocProvider.of<RegisterCubit>(context);

    return Form(
        key: GlobalKeys.riKey2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Name",
              style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const VsizedBox(height: 8),
            CustomTextFormField(
              stringController: regCubit.nameController,
              // ignore: body_might_complete_normally_nullable
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter correct name";
                }
              },
              hinttext: "Ex: Mostafa",
              securPass: false,
              width: double.infinity,
              height: 80.h,
            ),
            const VsizedBox(height: 12),
            Text(
              "Email Address",
              style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const VsizedBox(height: 8),
            CustomTextFormField(
              stringController: regCubit.emailController,

              // ignore: body_might_complete_normally_nullable
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
              "Phone Number",
              style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const VsizedBox(height: 8),
            CustomTextFormField(
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.hasNumber(value)) {
                  return "Please enter your correct Email";
                }
              },
              stringController: regCubit.phoneController,
              hinttext: "0123456789",
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
              // ignore: body_might_complete_normally_nullable
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter correct Password";
                } else if (!AppRegex.hasUpperCase(value) ||
                    !AppRegex.hasLowerCase(value) ||
                    !AppRegex.hasMinLength(value)) {
                  return "Password must have uppercase , lower case and 8 character ";
                }
              },
              passController: regCubit.passController,
            ),
          ],
        ));
  }
}
