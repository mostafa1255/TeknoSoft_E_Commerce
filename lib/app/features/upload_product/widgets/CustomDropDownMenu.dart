import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../logic/manager/product_Cubit/product_cubit.dart';

class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({
    super.key,
  });

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DropdownButton<String>(
        underline: Container(), // Remove underline
        icon: const Icon(Icons.arrow_drop_down), // Custom dropdown icon
        hint: const Text('Select a category'),
        value: selectedCategory,
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              selectedCategory = newValue;
              BlocProvider.of<ProductCubit>(context).productCategoryController =
                  selectedCategory;
            });
          }
        },
        items: categories.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

List<String> categories = ['Electronics', 'Clothes', 'Sports', 'School'];
String selectedCategory = 'Electronics';
