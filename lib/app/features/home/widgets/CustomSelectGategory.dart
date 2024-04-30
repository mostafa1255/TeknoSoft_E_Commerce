import 'package:e_commerce/app/core/styles/App_Image.dart';
import 'package:e_commerce/app/features/home/logic/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/App_Colors.dart';

class CustomSelectGategory extends StatelessWidget {
  const CustomSelectGategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 40.w, left: index == 0 ? 20.w : 0),
            child: Container(
              width: 45.w,
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.kPrimaryColor.withOpacity(0.6)),
              child: Center(
                child: IconButton(
                    onPressed: () {
                      BlocProvider.of<HomeCubit>(context).getProductByCategory(
                          category: categories[index].values.first);
                    },
                    icon: Image.asset(
                      categories[index].keys.first,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<Map<String, String>> categories = [
  {
    AppImages.iconclothes: "Clothes",
  },
  {AppImages.iconelectronics: "Electronics"},
  {AppImages.iconschool: "School"},
  {
    AppImages.iconsports: "Sports",
  }
];
