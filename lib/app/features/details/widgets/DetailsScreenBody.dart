import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/app/core/styles/App_Image.dart';
import 'package:e_commerce/app/core/widgets/FavoriteIconAction.dart';
import 'package:e_commerce/app/core/widgets/VsizedBox.dart';
import 'package:e_commerce/app/core/widgets/customMainButton.dart';
import 'package:e_commerce/app/features/upload_product/data/models/Products_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key, required this.product});
  final ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(
        top: 15.h,
      ),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 300.h,
            child: CachedNetworkImage(
              imageUrl: product.imageUrl!,
              placeholder: (context, url) {
                return const Center(child: Icon(Icons.image));
              },
            ),
          ),
          const VsizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name!,
                      style: Txtstyle.style22(context: context).copyWith(
                          color: AppColors.kFontColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const FavoriteIconAction()
                  ],
                ),
                Text(
                  "\$ ${product.price}",
                  style: Txtstyle.style20(context: context).copyWith(
                      color: AppColors.kFontColor, fontWeight: FontWeight.bold),
                ),
                const VsizedBox(height: 20),
                Text(
                  "Description of product",
                  style: Txtstyle.style24(context: context).copyWith(
                      color: AppColors.kFontColor, fontWeight: FontWeight.w500),
                ),
                Text(
                  product.description!,
                  style: Txtstyle.style14(context: context).copyWith(
                      color: AppColors.kFontColor, fontWeight: FontWeight.w400),
                ),
                const VsizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomMainButton(
                      color: AppColors.kPrimaryColor,
                      txt: "Add To Cart",
                      fcolorWhite: true,
                      width: 150.w,
                      onPressed: () {},
                    ),
                    CustomMainButton(
                      color: AppColors.kOfWhiteColor,
                      txt: "Buy Now",
                      width: 150.w,
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    ));
  }
}
