import 'package:e_commerce/app/core/styles/App_Colors.dart';
import 'package:e_commerce/app/features/home/data/repos/home_repo_impl.dart';
import 'package:e_commerce/app/features/home/logic/manager/cubit/home_cubit.dart';
import 'package:e_commerce/app/features/home/widgets/homeScreenAppBar.dart';
import 'package:e_commerce/app/router/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../widgets/HomeScreenBody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(homeRepo: HomeRepoImpl())..getAllProducts(),
      child: Scaffold(
        floatingActionButton: Stack(
          alignment: Alignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: AppColors.kPrimaryColor,
              onPressed: () {
                GoRouter.of(context).push(AppRouter.profile);
              },
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: homeScreenAppBar(context),
        body: const HomeScreenBody(),
      ),
    );
  }
}
