import 'package:e_commerce/app/core/utils/Stripe_Keys.dart';
import 'package:e_commerce/app/features/auth/data/repos/login_Repo/login_repo_Impl.dart';
import 'package:e_commerce/app/features/auth/data/repos/register_Repo/register_repo_Imp.dart';
import 'package:e_commerce/app/features/auth/logic/manager/login_Cubit/login_cubit.dart';
import 'package:e_commerce/app/features/auth/logic/manager/register_Cubit/register_cubit.dart';
import 'package:e_commerce/app/features/cart/data/cart_repo/cart_repo_Impl.dart';
import 'package:e_commerce/app/features/cart/manager/cart_Cubit/cart_cubit.dart';
import 'package:e_commerce/app/features/home/data/repos/home_repo_impl.dart';
import 'package:e_commerce/app/features/profile/data/user_repo/user_repo_impl.dart';
import 'package:e_commerce/app/features/profile/manager/user_cubit/user_cubit.dart';
import 'package:e_commerce/app/router/app_routing.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'app/core/tools/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  Stripe.publishableKey = ApiKeys.publishableKey;
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginCubit(LoginRepoImpl()),
            ),
            BlocProvider(
              create: (context) => RegisterCubit(RegisterRepoImpl()),
            ),
            BlocProvider(
              create: (context) =>
                  CartCubit(cartRepo: CartRepoImpl(), homeRepo: HomeRepoImpl()),
            ),
            BlocProvider(
                create: (context) =>
                    UserCubit(userRepo: UserRepoImpl())..getUserInfo()),
          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.routes,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
