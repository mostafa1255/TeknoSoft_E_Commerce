import 'package:e_commerce/app/core/styles/App_Colors.dart';
import 'package:e_commerce/app/core/styles/text_Style.dart';
import 'package:e_commerce/app/features/home/widgets/SearchHomeScreen.dart';
import 'package:e_commerce/app/features/upload_product/data/models/Products_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchDelegateHomeScreen extends StatelessWidget {
  const CustomSearchDelegateHomeScreen({
    super.key, required this.products,
  });
  final List<ProductsModel> products;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: SearchHomeScreen(products: products));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        width: 270.w,
        height: 60.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.kOfWhiteColor),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Search here",
            style: Txtstyle.style12(context: context).copyWith(
              color: AppColors.kDeepGreyColorA6A,
            ),
          ),
        ),
      ),
    );
  }
}
