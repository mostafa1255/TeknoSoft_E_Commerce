import 'package:e_commerce/app/features/details/widgets/detailsScreenAppBar.dart';
import 'package:flutter/material.dart';

import '../widgets/OrderScreenBody.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Orders", witerColor: true),
      body: const OrderScreenBody(),
    );
  }
}
