import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/App_Colors.dart';
import '../styles/App_Image.dart';

class CustomCartIcon extends StatelessWidget {
  const CustomCartIcon({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 50.w,
        height: 50.h,
        child: IconButton(
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
                BorderSide(width: 1.w, color: AppColors.kOfWhiteColor)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: onPressed,
          icon: const Icon(
            Icons.shopping_cart_checkout_outlined,
            color: AppColors.kFontColor,
          ),
        ));
  }
}
