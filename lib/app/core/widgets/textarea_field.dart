import 'package:flutter/material.dart';

import '../styles/App_Colors.dart';

class TextareaField extends StatelessWidget {
  const TextareaField(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);
  final controller;
  final hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffF7F7F9),
          borderRadius: BorderRadius.circular(9)),
      child: TextField(
          controller: controller,
          maxLines: 6,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(9)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kPrimaryColor)),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kPrimaryColor)),
              hintText: hintText,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 18))),
    );
  }
}
