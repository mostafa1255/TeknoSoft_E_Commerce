import 'package:e_commerce/app/features/details/widgets/DetailsScreenBody.dart';
import 'package:e_commerce/app/features/details/widgets/detailsScreenAppBar.dart';
import 'package:e_commerce/app/features/upload_product/data/models/Products_Model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.productsModel});
  final ProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, title: "Details Screen", witerColor: false),
      body: DetailsScreenBody(
        product: productsModel,
      ),
    );
  }
}
