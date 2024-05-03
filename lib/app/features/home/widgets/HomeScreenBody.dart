import 'package:e_commerce/app/core/widgets/Lottie_Loading_Animation.dart';
import 'package:e_commerce/app/core/widgets/VsizedBox.dart';
import 'package:e_commerce/app/features/home/logic/manager/cubit/home_cubit.dart';
import 'package:e_commerce/app/features/home/widgets/WidgetsReturnFromSuccessStatesHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is FetchingAllProducts ||
              state is FetchingProductsByCategory) {
            return const Center(
              
              child: Lottie_Loading_Animation());
          } else if (state is AllProductsFetched) {
            return WidgetsReturnFromSuccessStatesHomeScreen(
              products: state.products,
              category: "All",
            );
          } else if (state is ErrorFetchingAllProducts) {
            return Text(
              state.errMessage,
              style: Txtstyle.style25(context: context).copyWith(
                  color: AppColors.kFontColor, fontWeight: FontWeight.w400),
            );
          } else if (state is ErrorFetchingProductsByCategory) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        context.read<HomeCubit>().getAllProducts();
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Back",
                          style: Txtstyle.style20(context: context).copyWith(
                              color: AppColors.kFontColor,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                  const VsizedBox(height: 250),
                  Text(
                    state.errMessage,
                    style: Txtstyle.style25(context: context).copyWith(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            );
          } else if (state is ProductsByCategoryFetched) {
            return WidgetsReturnFromSuccessStatesHomeScreen(
              products: state.products,
              category: state.products[0].category!,
            );
          } else {
            return const Center(child: SizedBox.shrink());
          }
        },
      )),
    ));
  }
}

