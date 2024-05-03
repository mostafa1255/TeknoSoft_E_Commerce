import 'package:e_commerce/app/core/functions/determine_current_location.dart';
import 'package:e_commerce/app/core/styles/text_Style.dart';
import 'package:flutter/material.dart';

class CustomDeterminedCurrenLocation extends StatelessWidget {
  const CustomDeterminedCurrenLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: determineCurrentLocation(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!,
            style: Txtstyle.style14(context: context).copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          );
        }
        return Center(
          child: Text(
            "Loading...",
            style: Txtstyle.style14(context: context).copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
