import 'package:e_commerce/app/core/tools/api_services.dart';
import 'package:e_commerce/app/features/check_out/manager/Stripe_Payment_Cubit/stripe_payment_cubit.dart';
import 'package:e_commerce/app/features/check_out/widgets/BottomNavBarCheckOutScreen.dart';
import 'package:e_commerce/app/features/details/widgets/detailsScreenAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cart/data/models/cart_Model.dart';
import '../widgets/CheckOutScreenBody.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen(
      {super.key, required this.cartModel, required this.total});
  final List<CartModel> cartModel;
  final String total;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context: context, title: "Checkouts", witerColor: false),
      body: CheckOutScreenBody(
        cartModel: cartModel,
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) => StripePaymentCubit(apiServices: ApiServices()),
        child: BottomNavBarCheckOutScreen(
          total: total,
        ),
      ),
    );
  }
}
