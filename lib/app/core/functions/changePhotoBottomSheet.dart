import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../styles/App_Colors.dart';
import '../widgets/VsizedBox.dart';
import '../widgets/customMainButton.dart';

dynamic changePhotoBottomSheet(
    {required BuildContext context,
    void Function()? onPressed2,
    void Function()? onPressed3}) {
  return showBottomSheet(
    backgroundColor: AppColors.kOfWhiteColor,
    context: context,
    builder: (context) {
      return SizedBox(
        height: 200.h,
        width: 375.w,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(
                    Icons.cancel,
                    size: 25.sp,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ),
            ),
            CustomMainButton(
              onPressed: onPressed2,
              fcolorWhite: true,
              width: 200.w,
              color: AppColors.kPrimaryColor,
              txt: "Take Photo",
            ),
            const VsizedBox(height: 10),
            CustomMainButton(
              onPressed: onPressed3,
              width: 200.w,
              color: AppColors.kPrimaryColor,
              txt: "Choose Photo",
              fcolorWhite: true,
            )
          ],
        ),
      );
    },
  );
}
