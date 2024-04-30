import 'package:e_commerce/app/features/details/widgets/detailsScreenAppBar.dart';
import 'package:e_commerce/app/features/profile/data/user_repo/user_repo_impl.dart';
import 'package:e_commerce/app/features/profile/manager/user_cubit/user_cubit.dart';
import 'package:e_commerce/app/features/profile/widgets/ProfileScreenBody.dart';
import 'package:e_commerce/app/features/upload_product/logic/manager/product_Cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../upload_product/data/repos/image_picker_repo/image_picker_repo_impl.dart';
import '../../upload_product/data/repos/product_Repo/product_repo_Impl.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
          imagePickerRepo: ImagePickerRepoImpl(),
          productRepo: ProductRepoImpl()),
      child: Scaffold(
        appBar: customAppBar(
            context: context, title: "My Profile", witerColor: false),
        body:  ProfileScreenBody(),
      ),
    );
  }
}
