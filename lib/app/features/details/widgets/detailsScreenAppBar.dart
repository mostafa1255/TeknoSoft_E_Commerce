import 'package:e_commerce/app/router/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import '../../../core/widgets/CustomBackIcon.dart';
import '../../../core/widgets/CustomCartIcon.dart';
import '../../../core/widgets/HsizedBox.dart';

AppBar customAppBar(
    {required BuildContext context,
    required String title,
    required bool witerColor}) {
  return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: witerColor ? Colors.white : AppColors.kOfWhiteColor,
      leading: CustomBackAndFavIcon(
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      title: Text(
        title,
        style: Txtstyle.style16(context: context).copyWith(
          color: AppColors.kFontColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      actions: [
        CustomCartIcon(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.cart);
          },
        ),
        HsizedBox(width: 15.w)
      ]);
}
