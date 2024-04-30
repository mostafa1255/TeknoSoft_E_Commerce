import 'package:e_commerce/app/features/details/widgets/detailsScreenAppBar.dart';
import 'package:e_commerce/app/features/upload_product/data/repos/image_picker_repo/image_picker_repo_impl.dart';
import 'package:e_commerce/app/features/upload_product/data/repos/product_Repo/product_repo_Impl.dart';
import 'package:e_commerce/app/features/upload_product/logic/manager/product_Cubit/product_cubit.dart';
import 'package:e_commerce/app/features/upload_product/widgets/UploadProductScreenBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadProductScreen extends StatelessWidget {
  const UploadProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
          imagePickerRepo: ImagePickerRepoImpl(),
          productRepo: ProductRepoImpl()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(
            context: context, title: "Upload Product", witerColor: true),
        body: const UploadProductScreenBody(),
      ),
    );
  }
}
