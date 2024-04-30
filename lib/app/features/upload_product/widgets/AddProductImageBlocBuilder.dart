import 'package:e_commerce/app/core/functions/Snack_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/functions/changePhotoBottomSheet.dart';
import '../../../core/styles/App_Colors.dart';
import '../logic/manager/product_Cubit/product_cubit.dart';

class AddProductImageBlocBuilder extends StatelessWidget {
  AddProductImageBlocBuilder({
    super.key,
    required this.pCubit,
  });

  final ProductCubit pCubit;
  String imageUrl = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ImageUploadedSuccsess) {
            pCubit.productImageUrl = state.imageUrl;
            imageUrl = state.imageUrl;
            return CircleAvatar(
                radius: 70.r,
                backgroundColor: Colors.grey.shade300.withOpacity(0.55),
                backgroundImage: NetworkImage(state.imageUrl));
          } else if (state is ImageUploadedLoading) {
            return CircleAvatar(
              radius: 70.r,
              backgroundColor: Colors.grey.shade300.withOpacity(0.55),
              child: const Center(
                  child: CircularProgressIndicator(
                color: AppColors.kPrimaryColor,
              )),
            );
          } else if (state is ImageUploadedFaliure) {
            return CircleAvatar(
              radius: 70.r,
              backgroundColor: Colors.grey.shade300.withOpacity(0.55),
              child: IconButton(
                  onPressed: () {
                    customsnackBar(context, state.errMessage, Colors.red);
                    changePhotoBottomSheet(
                      context: context,
                      onPressed2: () async {
                        await pCubit.getImageFromCameraAndUploadtoStorage();
                        // GoRouter.of(context).pop();
                      },
                      onPressed3: () async {
                        await pCubit.getImageFromGalleryAndUploadtoStorage();
                        // GoRouter.of(context).pop();
                      },
                    );
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    color: AppColors.kPrimaryColor,
                    size: 25.sp,
                  )),
            );
          } else {
            return CircleAvatar(
              radius: 70.r,
              backgroundColor: Colors.grey.shade300.withOpacity(0.55),
              child: IconButton(
                  onPressed: () {
                    changePhotoBottomSheet(
                      context: context,
                      //onPressed1: () => GoRouter.of(context).pop(),
                      onPressed2: () async {
                        await pCubit.getImageFromCameraAndUploadtoStorage();
                        // GoRouter.of(context).pop();
                      },
                      onPressed3: () async {
                        await pCubit.getImageFromGalleryAndUploadtoStorage();
                        // GoRouter.of(context).pop();
                      },
                    );
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    color: AppColors.kPrimaryColor,
                    size: 25.sp,
                  )),
            );
          }
        },
      ),
    );
  }
}
