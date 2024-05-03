import 'package:e_commerce/app/core/functions/determine_current_location.dart';
import 'package:e_commerce/app/core/styles/App_Colors.dart';
import 'package:e_commerce/app/core/styles/text_Style.dart';
import 'package:e_commerce/app/core/widgets/CustomDeterminedCurrenLocation.dart';
import 'package:e_commerce/app/router/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

AppBar homeScreenAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Delivery to",
          style: Txtstyle.style12(context: context).copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.kGreyColorB81,
          ),
        ),
        const CustomDeterminedCurrenLocation()
      ],
    ),
    actions: [
      IconButton(
          onPressed: () {
            GoRouter.of(context).push(
              AppRouter.cart,
            );
          },
          icon: const Icon(
            Icons.shopping_cart_checkout_outlined,
            color: AppColors.kGreyColorB81,
          )),
      IconButton(
          onPressed: () {
            GoRouter.of(context).push(
              AppRouter.order,
            );
          },
          icon: const Icon(
            Icons.shopping_bag_outlined,
            color: AppColors.kGreyColorB81,
          )),
    ],
  );
}
