import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/app/core/styles/App_Colors.dart';
import 'package:e_commerce/app/core/styles/App_Image.dart';
import 'package:e_commerce/app/core/styles/text_Style.dart';
import 'package:e_commerce/app/core/widgets/HsizedBox.dart';
import 'package:e_commerce/app/features/upload_product/data/models/Products_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderScreenBody extends StatelessWidget {
  const OrderScreenBody({super.key, required this.products});
  final List<ProductsModel> products;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            itemCount: products.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 140.h,
                margin: EdgeInsets.only(bottom: 20.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.kOfWhiteColor),
                        child: CachedNetworkImage(
                            imageUrl: products[index].imageUrl!),
                      ),
                      const HsizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200.w,
                            height: 40.h,
                            child: AutoSizeText(
                              products[index].name!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Txtstyle.style16(context: context)
                                  .copyWith(
                                      color: AppColors.kFontColor,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "\$ ${products[index].price}",
                            style: Txtstyle.style18(context: context).copyWith(
                                color: AppColors.kFontColor.withOpacity(0.5),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const HsizedBox(width: 120),
                              Text(
                                "Completed",
                                style: Txtstyle.style12(context: context)
                                    .copyWith(
                                        color: AppColors.kPrimaryColor,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      )),
    ));
  }
}
