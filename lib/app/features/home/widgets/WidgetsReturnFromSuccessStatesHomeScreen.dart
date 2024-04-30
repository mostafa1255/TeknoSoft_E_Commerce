import 'package:e_commerce/app/core/styles/App_Colors.dart';
import 'package:e_commerce/app/core/styles/text_Style.dart';
import 'package:e_commerce/app/core/widgets/VsizedBox.dart';
import 'package:e_commerce/app/features/cart/manager/cart_Cubit/cart_cubit.dart';
import 'package:e_commerce/app/features/home/data/repos/home_repo_impl.dart';
import 'package:e_commerce/app/features/home/widgets/CustomSearchDelegateHomeScreen.dart';
import 'package:e_commerce/app/features/home/widgets/CustomSelectGategory.dart';
import 'package:e_commerce/app/features/home/widgets/OffersHomeListView.dart';
import 'package:e_commerce/app/features/home/widgets/PreviewProductGridView.dart';
import 'package:e_commerce/app/features/upload_product/data/models/Products_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/data/cart_repo/cart_repo_Impl.dart';

class WidgetsReturnFromSuccessStatesHomeScreen extends StatelessWidget {
  const WidgetsReturnFromSuccessStatesHomeScreen({
    super.key,
    required this.category,
    required this.products,
  });
  final List<ProductsModel> products;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchDelegateHomeScreen(
          products: products,
        ),
        const VsizedBox(height: 10),
        OffersHomeListView(
          products: products,
        ),
        const VsizedBox(height: 10),
        Text(
          "Categories",
          style: Txtstyle.style16(context: context).copyWith(
              color: AppColors.kFontColor, fontWeight: FontWeight.w500),
        ),
        const VsizedBox(height: 15),
        const CustomSelectGategory(),
        const VsizedBox(height: 20),
        Text(
          "$category products",
          style: Txtstyle.style18(context: context).copyWith(
              color: AppColors.kFontColor, fontWeight: FontWeight.w500),
        ),
        const VsizedBox(height: 20),
        BlocProvider(
          create: (context) =>
              CartCubit(cartRepo: CartRepoImpl(), homeRepo: HomeRepoImpl()),
          child: PreviewProductGridView(
            products: products,
          ),
        )
      ],
    );
  }
}
