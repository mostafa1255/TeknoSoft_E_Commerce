import 'package:e_commerce/app/core/styles/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/text_Style.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.hinttext,
    required this.securPass,
    this.stringController,
    required this.width,
    required this.height,
    this.widget,
    this.validator,
    this.fontcolor,
    this.enableWriting,
    this.initialValue,
    this.inputFormatters,
  });
  final bool securPass;
  final TextEditingController? stringController;
  final double width;
  final double height;
  final String? hinttext;
  final Widget? widget;
  final Color? fontcolor;
  final bool? enableWriting;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;

  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        inputFormatters: inputFormatters,
        validator: validator,
        initialValue: stringController != null ? null : initialValue,
        enabled: enableWriting ?? true,
        style: const TextStyle(color: Colors.black),
        controller: stringController,
        obscureText: securPass,
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(10.r)),
            suffixIcon: widget,
            fillColor: const Color(0xffF7F7F9),
            filled: true,
            hintText: hinttext,
            hintStyle: Txtstyle.style14(
              context: context,
            ).copyWith(
                color: fontcolor ?? AppColors.kDeepGreyColorA6A,
                fontWeight: FontWeight.w500),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r))),
      ),
    );
  }
}
