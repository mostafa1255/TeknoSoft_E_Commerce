import 'package:e_commerce/app/core/styles/text_Style.dart';
import 'package:flutter/material.dart';
import '../styles/App_Colors.dart';

class CustomCurrentLocationWidget extends StatelessWidget {
  const CustomCurrentLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Delivery to",
          style: Txtstyle.style12(context: context).copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.kGreyColorB81,
          ),
        ),
        Text(
          "Alexander Place, London",
          style: Txtstyle.style14(context: context).copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
