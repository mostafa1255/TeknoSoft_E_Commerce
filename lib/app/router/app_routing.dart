import 'package:e_commerce/app/features/auth/screens/login_screen.dart';
import 'package:e_commerce/app/features/auth/screens/register_screen.dart';
import 'package:e_commerce/app/features/cart/data/cart_repo/cart_repo_Impl.dart';
import 'package:e_commerce/app/features/cart/data/models/cart_Model.dart';
import 'package:e_commerce/app/features/cart/manager/cart_Cubit/cart_cubit.dart';
import 'package:e_commerce/app/features/cart/screens/cart_screen.dart';
import 'package:e_commerce/app/features/check_out/screens/check_out.dart';
import 'package:e_commerce/app/features/check_out/screens/payment_success_screen.dart';
import 'package:e_commerce/app/features/details/screens/details_screen.dart';
import 'package:e_commerce/app/features/home/data/repos/home_repo_impl.dart';
import 'package:e_commerce/app/features/home/logic/manager/cubit/home_cubit.dart';
import 'package:e_commerce/app/features/home/screens/home_screen.dart';
import 'package:e_commerce/app/features/order/manager/cubit/order_cubit.dart';
import 'package:e_commerce/app/features/order/screen/order_screen.dart';
import 'package:e_commerce/app/features/upload_product/data/models/Products_Model.dart';
import 'package:e_commerce/app/features/upload_product/screen/upload_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const root = '/';
  static const register = '/register';
  static const home = '/home';
  static const profile = '/profile';
  static const account = '/account';
  static const cart = '/cart';
  static const details = '/details';
  static const uploadProduct = '/uploadProduct';
  static const order = '/order';
  static const checkOut = '/checkOut';
  static const successPayment = '/successPayment';

  static final routes = GoRouter(routes: [
    GoRoute(
      path: home,
      builder: (context, state) => BlocProvider(
        create: (context) =>
            HomeCubit(homeRepo: HomeRepoImpl())..getAllProducts(),
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: root,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: register,
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
        path: checkOut,
        builder: (context, state) {
          final Map<String, dynamic>? extraData =
              state.extra as Map<String, dynamic>?;
          List<CartModel> cartModel = extraData!["cartModel"];
          String total = extraData["total"];
          return CheckOutScreen(
            cartModel: cartModel,
            total: total,
          );
        }),
    GoRoute(
      path: cart,
      builder: (context, state) => BlocProvider(
        create: (context) =>
            CartCubit(cartRepo: CartRepoImpl(), homeRepo: HomeRepoImpl())
              ..getCartProducts(),
        child: const CartScreen(),
      ),
    ),
    GoRoute(
      path: details,
      builder: (context, state) =>
          DetailsScreen(productsModel: state.extra as ProductsModel),
    ),
    GoRoute(
      path: successPayment,
      builder: (context, state) => const PaymentSuccessScreen(),
    ),
    GoRoute(
      path: uploadProduct,
      builder: (context, state) => const UploadProductScreen(),
    ),
    GoRoute(
      path: order,
      builder: (context, state) => BlocProvider(
        create: (context) =>
            OrderCubit(homeRepo: HomeRepoImpl())..getAllOrdersProducts(),
        child: OrderScreen(),
      ),
    ),
  ]);
}
