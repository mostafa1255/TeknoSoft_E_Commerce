import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/app/core/styles/App_Colors.dart';
import 'package:e_commerce/app/core/styles/text_Style.dart';
import 'package:e_commerce/app/core/widgets/customMainButton.dart';
import 'package:e_commerce/app/features/cart/manager/cart_Cubit/cart_cubit.dart';
import 'package:e_commerce/app/router/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/VsizedBox.dart';
import '../../upload_product/data/models/Products_Model.dart';

class PreviewProductGridView extends StatelessWidget {
  const PreviewProductGridView({
    super.key,
    required this.products,
  });
  final List<ProductsModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          crossAxisCount: 2,
          childAspectRatio: 3.2.h / 4.w),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.details,
              extra: products[index],
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: AppColors.kOfWhiteColor),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: products[index].imageUrl!,
                    height: 120.h,
                    width: 140.w,
                  ),
                  const VsizedBox(height: 5),
                  Text(
                    products[index].name!,
                    style: Txtstyle.style16(context: context).copyWith(
                        color: AppColors.kFontColor,
                        fontWeight: FontWeight.w400),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 140.w,
                      height: 30.h,
                      child: AutoSizeText(
                        "\$${products[index].price}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Txtstyle.style16(context: context).copyWith(
                            color: AppColors.kFontColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  CustomMainButton(
                    color: AppColors.kPrimaryColor,
                    fcolorWhite: true,
                    width: 150.w,
                    height: 45.h,
                    txt: "Add To Cart",
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context)
                          .addToCartProducts(productsModel: products[index]);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
