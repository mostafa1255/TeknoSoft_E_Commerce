import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../styles/App_Image.dart';

class Lottie_Loading_Animation extends StatelessWidget {
  const Lottie_Loading_Animation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppImages.lottieLoadingAnimation),
    );
  }
}
