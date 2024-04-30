import 'package:e_commerce/app/core/styles/App_Colors.dart';
import 'package:e_commerce/app/core/styles/text_Style.dart';
import 'package:e_commerce/app/core/widgets/ToastMessage.dart';
import 'package:e_commerce/app/core/widgets/customMainButton.dart';
import 'package:e_commerce/app/features/cart/data/models/cart_Model.dart';
import 'package:e_commerce/app/features/cart/manager/cart_Cubit/cart_cubit.dart';
import 'package:e_commerce/app/features/details/widgets/detailsScreenAppBar.dart';
import 'package:e_commerce/app/features/profile/screens/profile_screen.dart';
import 'package:e_commerce/app/router/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/functions/calculateSubTotalPrice.dart';
import '../widgets/CartScreenBody.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOfWhiteColor,
      appBar:
          customAppBar(context: context, title: "Your Cart", witerColor: false),
      body: const CartScreenBody(),
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is GetFromCartSuccsess) {
            return CartBottomNavigationBar(
              cartModel: state.products,
              total: state.totalPrice.toString(),
            );
          } else if (state is GetFromCartFailure) {
            ToastMessage(message: state.errMessage).showToast(context);
          } else if (state is GetFromCartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class CartBottomNavigationBar extends StatelessWidget {
  const CartBottomNavigationBar({
    super.key,
    required this.total,
    required this.cartModel,
  });
  final String total;
  final List<CartModel> cartModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140.h,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Totals",
                    style: Txtstyle.style18(context: context).copyWith(
                        color: AppColors.kGreyColorB81,
                        fontWeight: FontWeight.w400)),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is GetFromCartSuccsess) {
                      return Text(
                          "\$ ${calculateSubTotalPrice(state.products, state.totalPrice)}",
                          style: Txtstyle.style18(context: context).copyWith(
                              color: AppColors.kFontColor,
                              fontWeight: FontWeight.w700));
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                )
              ],
            ),
            CustomMainButton(
                width: 300.w,
                onPressed: () {
                  GoRouter.of(context).push(
                    AppRouter.checkOut,
                    extra: {
                      "cartModel": cartModel,
                      'total': total,
                    },
                  );
                },
                color: Colors.grey[100]!,
                txt: "Continue to payment")
          ],
        ),
      ),
    );
  }
}
