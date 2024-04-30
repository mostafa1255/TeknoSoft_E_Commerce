import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import '../../../core/tools/save_Items_InSerach.dart';

class SavedItemsResultFutuBuilderWidget extends StatelessWidget {
  const SavedItemsResultFutuBuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: SaveSearchProducts.getItems(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Set<String> uniqueItems = snapshot.data!.toSet();
          List<String> savedItems = uniqueItems.toList();
          return ListView.builder(
            itemCount: savedItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                onTap: () {},
                leading:
                    const Icon(Icons.timer, color: AppColors.kPrimaryColor),
                title: Text(
                  savedItems[index],
                  style: Txtstyle.style14(context: context).copyWith(
                    color: AppColors.kGreyColorB81,
                  ),
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
