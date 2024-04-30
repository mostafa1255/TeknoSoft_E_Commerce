import 'package:e_commerce/app/core/styles/App_Image.dart';
import 'package:e_commerce/app/core/widgets/VsizedBox.dart';
import 'package:e_commerce/app/core/widgets/customMainButton.dart';
import 'package:e_commerce/app/router/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 100.h, left: 14.w, right: 14.w),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              AppImages.lottieSuccessAnimation,
            ),
            const VsizedBox(height: 20),
            Text(
              "Congratulations! Your payment was successfully",
              textAlign: TextAlign.center,
              style: Txtstyle.style25(context: context).copyWith(
                  color: AppColors.kFontColor, fontWeight: FontWeight.bold),
            ),
            const VsizedBox(height: 140),
            CustomMainButton(
                color: AppColors.kPrimaryColor,
                width: 375.w,
                txt: "Continue",
                fcolorWhite: true,
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRouter.home);
                })
          ],
        )),
      )),
    );
  }
}
