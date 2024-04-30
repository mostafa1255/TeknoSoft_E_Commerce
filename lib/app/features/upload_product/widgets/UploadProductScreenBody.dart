import 'package:e_commerce/app/core/widgets/customMainButton.dart';
import 'package:e_commerce/app/features/upload_product/logic/manager/product_Cubit/product_cubit.dart';
import 'package:e_commerce/app/features/upload_product/widgets/AddProductImageBlocBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import '../../../core/widgets/CustomTextFormField.dart';
import '../../../core/widgets/VsizedBox.dart';
import '../../../core/widgets/textarea_field.dart';
import 'CustomDropDownMenu.dart';

class UploadProductScreenBody extends StatelessWidget {
  const UploadProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var pCubit = BlocProvider.of<ProductCubit>(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AddProductImageBlocBuilder(
                pCubit: BlocProvider.of<ProductCubit>(context)),
            const VsizedBox(height: 20),
            Text(
              "name of product",
              style: Txtstyle.style14(context: context).copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.kFontColor),
            ),
            const VsizedBox(height: 10),
            CustomTextFormField(
              stringController: pCubit.productNameController,
              securPass: false,
              width: 375.w,
              height: 60.h,
              hinttext: "Air Jordan 1",
            ),
            const VsizedBox(height: 20),
            Text(
              "Category",
              style: Txtstyle.style14(context: context).copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.kFontColor),
            ),
            const VsizedBox(height: 10),
            const CustomDropDownMenu(),
            const VsizedBox(height: 20),
            Text(
              "price",
              style: Txtstyle.style14(context: context).copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.kFontColor),
            ),
            const VsizedBox(height: 10),
            CustomTextFormField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              stringController: pCubit.productPriceController,
              securPass: false,
              width: 375.w,
              height: 60.h,
              hinttext: "200\$",
            ),
            const VsizedBox(height: 20),
            Text(
              "description",
              style: Txtstyle.style14(context: context).copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.kFontColor),
            ),
            const VsizedBox(height: 10),
            TextareaField(
              hintText: "The Best Air Jordan",
              controller: pCubit.productDescreptionController,
            ),
            const VsizedBox(height: 20),
            CustomMainButton(
              color: AppColors.kPrimaryColor,
              onPressed: () {
                pCubit.uploadProducts(context: context);
              },
              txt: "Upload",
              fcolorWhite: true,
              width: 375.w,
            ),
            const VsizedBox(height: 50),
          ]),
        ),
      ),
    );
  }
}
