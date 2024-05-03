import 'package:e_commerce/app/core/styles/text_Style.dart';
import 'package:e_commerce/app/features/details/widgets/detailsScreenAppBar.dart';
import 'package:e_commerce/app/features/order/manager/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/OrderScreenBody.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Orders", witerColor: true),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderGetAllProductsSuccsess) {
            return OrderScreenBody(
              products: state.products,
            );
          } else if (state is OrderGetAllProductsFailure) {
            return Center(
              child: Text(state.errMessage,
                  style: Txtstyle.style20(context: context).copyWith()),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
