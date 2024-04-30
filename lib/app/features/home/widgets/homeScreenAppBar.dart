import 'package:e_commerce/app/core/functions/determine_current_location.dart';
import 'package:e_commerce/app/core/styles/App_Colors.dart';
import 'package:e_commerce/app/core/styles/text_Style.dart';
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
        FutureBuilder(
          future: determineCurrentLocation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data!,
                style: Txtstyle.style14(context: context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              );
            }
            return Center(
              child: Text(
                "Loading...",
                style: Txtstyle.style14(context: context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            );
          },
        )
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
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.bell,
            color: AppColors.kGreyColorB81,
          )),
    ],
  );
}
