import 'package:e_commerce/app/features/home/data/repos/home_repo_impl.dart';
import 'package:e_commerce/app/features/home/logic/manager/cubit/home_cubit.dart';
import 'package:e_commerce/app/features/home/widgets/homeScreenAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/HomeScreenBody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(homeRepo: HomeRepoImpl())..getAllProducts(),
      child: Scaffold(
        appBar: homeScreenAppBar(context),
        body: const HomeScreenBody(),
      ),
    );
  }
}
