import 'package:e_commerce/app/core/styles/App_Colors.dart';
import 'package:e_commerce/app/core/styles/text_Style.dart';
import 'package:e_commerce/app/core/widgets/customMainButton.dart';
import 'package:e_commerce/app/features/cart/manager/cart_Cubit/cart_cubit.dart';
import 'package:e_commerce/app/features/check_out/manager/Stripe_Payment_Cubit/stripe_payment_cubit.dart';
import 'package:e_commerce/app/features/order/manager/cubit/order_cubit.dart';
import 'package:e_commerce/app/features/upload_product/data/models/Products_Model.dart';
import 'package:e_commerce/app/router/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
class BottomNavBarCheckOutScreen extends StatelessWidget {
  const BottomNavBarCheckOutScreen({
    super.key,
    required this.total,
    required this.products,
  });
  final String total;
  final List<ProductsModel> products;

  @override
  Widget build(BuildContext context) {
    var orderCubit = BlocProvider.of<OrderCubit>(context);
    return Container(
      width: double.infinity,
      height: 250.h,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Summary",
                style: Txtstyle.style18(context: context).copyWith(
                    color: AppColors.kFontColor, fontWeight: FontWeight.w700)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total price",
                    style: Txtstyle.style18(context: context).copyWith(
                        color: AppColors.kGreyColorB81,
                        fontWeight: FontWeight.w400)),
                Text("\$ $total",
                    style: Txtstyle.style18(context: context).copyWith(
                        color: AppColors.kFontColor,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("MarketPlace fee",
                    style: Txtstyle.style18(context: context).copyWith(
                        color: AppColors.kGreyColorB81,
                        fontWeight: FontWeight.w400)),
                Text("\$ 43.00",
                    style: Txtstyle.style18(context: context).copyWith(
                        color: AppColors.kFontColor,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Totals",
                    style: Txtstyle.style18(context: context).copyWith(
                        color: AppColors.kGreyColorB81,
                        fontWeight: FontWeight.w400)),
                Text("\$ ${num.parse(total) + 43.00}",
                    style: Txtstyle.style18(context: context).copyWith(
                        color: AppColors.kFontColor,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            BlocListener<StripePaymentCubit, StripePaymentState>(
              listener: (context, state) async {
                if (state is StripePaymentSucsess) {
                  await orderCubit.putAllOrdersProducts(
                    productsModel: products,
                  );
                  await BlocProvider.of<CartCubit>(context)
                      .deleteAllCartItems(cartItems: products);
                  GoRouter.of(context)
                      .pushReplacement(AppRouter.successPayment);
                }
              },
              child: CustomMainButton(
                  width: 300.w,
                  onPressed: () async {
                    double totalAmount = double.parse(total) + 43.0;
                    int totals = totalAmount.toInt();
                    await BlocProvider.of<StripePaymentCubit>(context)
                        .makePayment(totals, "USD");
                  },
                  color: AppColors.kPrimaryColor,
                  fcolorWhite: true,
                  txt: "Select payment method"),
            )
          ],
        ),
      ),
    );
  }
}
