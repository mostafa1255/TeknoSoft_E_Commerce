import 'package:e_commerce/app/core/styles/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/App_Colors.dart';
import '../logic/functions/saveItemToSearchSharedPreference.dart';

class SearchFilteredResultWidget extends StatelessWidget {
  const SearchFilteredResultWidget({
    super.key,
    required this.filterList,
  });

  final List<String>? filterList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filterList!.length,
      itemBuilder: (context, index) {
        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          onTap: () {
            saveItemToSearchSharedPreference(item: filterList![index]);
          },
          title: Text(
            filterList![index],
            style: Txtstyle.style14(context: context).copyWith(
              color: AppColors.kFontColor,
            ),
          ),
        );
      },
    );
  }
}
