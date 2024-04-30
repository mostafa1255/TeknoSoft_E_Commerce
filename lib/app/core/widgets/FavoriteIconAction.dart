import 'package:e_commerce/app/core/styles/App_Colors.dart';
import 'package:e_commerce/app/core/widgets/ToastMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteIconAction extends StatefulWidget {
  const FavoriteIconAction({
    Key? key,
  }) : super(key: key);

  @override
  _FavoriteIconActionState createState() => _FavoriteIconActionState();
}

class _FavoriteIconActionState extends State<FavoriteIconAction> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20.r,
      backgroundColor: AppColors.kGreyColorB81.withOpacity(0.1),
      child: IconButton(
        onPressed: () {
          if (isFavorite == false) {
            const ToastMessage(message: "Added To Favorites")
                .showToast(context);
          }
          //    BlocProvider.of<FavoriteCubit>(context)
          //      .addToFavoritesProducts(productsModel: widget.favProduct);
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: Icon(
          isFavorite ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
          color: isFavorite ? Colors.red : null,
          size: 20,
        ),
      ),
    );
  }
}
