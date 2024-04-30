import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/app/core/widgets/CustomCurrentLocationWidget.dart';
import 'package:e_commerce/app/core/widgets/HsizedBox.dart';
import 'package:e_commerce/app/core/widgets/VsizedBox.dart';
import 'package:e_commerce/app/features/cart/manager/cart_Cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';

class CartScreenBody extends StatefulWidget {
  const CartScreenBody({super.key});

  @override
  State<CartScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<CartScreenBody> {
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetFromCartSuccsess) {
          return SafeArea(
              child: Padding(
            padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomCurrentLocationWidget(),
                const VsizedBox(height: 15),
                ListView.builder(
                  itemCount: state.products.length,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
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
                                imageUrl: state
                                    .products[index].productsModel.imageUrl!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.kPrimaryColor,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const HsizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  height: 40.h,
                                  child: AutoSizeText(
                                    state.products[index].productsModel.name!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Txtstyle.style16(context: context)
                                        .copyWith(
                                            color: AppColors.kFontColor,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "\$ ${state.products[index].productsModel.price}",
                                  style: Txtstyle.style18(context: context)
                                      .copyWith(
                                          color: AppColors.kFontColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const HsizedBox(width: 65),
                                    CircleAvatar(
                                      radius: 17.r,
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.1),
                                      child: IconButton(
                                          onPressed: () {
                                            cartCubit.updateQuantityofProduct(
                                                id: state.products[index]
                                                    .productsModel.id!,
                                                quantity: --state
                                                    .products[index].quantity);
                                            setState(() {});
                                          },
                                          icon: Icon(
                                            FontAwesomeIcons.minus,
                                            size: 17.sp,
                                          )),
                                    ),
                                    const HsizedBox(width: 10),
                                    Text(
                                        state.products[index].quantity
                                            .toString(),
                                        style:
                                            Txtstyle.style16(context: context)
                                                .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.kFontColor,
                                        )),
                                    const HsizedBox(width: 10),
                                    CircleAvatar(
                                      radius: 17.r,
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.1),
                                      child: IconButton(
                                          onPressed: () {
                                            cartCubit.updateQuantityofProduct(
                                                id: state.products[index]
                                                    .productsModel.id!,
                                                quantity: ++state
                                                    .products[index].quantity);
                                            setState(() {});
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            size: 17.sp,
                                          )),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          cartCubit.deleteCartItem(
                                              productId: state.products[index]
                                                  .productsModel.id!);
                                          cartCubit.getCartProducts();
                                          state.products.removeAt(index);
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.redAccent,
                                          size: 20.sp,
                                        )),
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
        } else if (state is GetFromCartFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: Txtstyle.style22(context: context).copyWith(
                  color: AppColors.kFontColor, fontWeight: FontWeight.bold),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.kPrimaryColor,
            ),
          );
        }
      },
    );
  }
}
