import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/app/features/cart/data/cart_repo/cart_repo.dart';
import 'package:e_commerce/app/features/cart/data/models/cart_Model.dart';
import 'package:e_commerce/app/features/home/data/repos/home_repo.dart';
import 'package:e_commerce/app/features/upload_product/data/models/Products_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepo, required this.homeRepo})
      : super(CartInitial());
  final dataBase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  HomeRepo homeRepo;
  CartRepo cartRepo;
  Future<void> updateQuantityofProduct(
      {required String id, required int quantity}) async {
    if (quantity > 0) {
      final result =
          await cartRepo.updateQuantityofProduct(id: id, quantity: quantity);
      result.fold(
        (l) => emit(CartQuantityUpdatedFaliure(errMessage: l.errmessage)),
        (r) => getCartProducts(),
      );
    }
  }

  Future<void> addToCartProducts({required ProductsModel productsModel}) async {
    emit(AddtoCartProductsLoading());
    final result = await cartRepo.addProductWithQuantityToCart(
        productsModel: productsModel);
    result.fold(
      (l) {
        print("Cart Products to failure");

        emit(AddtoCartProductsFailure(errMessage: l.errmessage));
      },
      (r) {
        print("Cart Products to succsess");

        emit(AddtoCartProductsSuccsess());
      },
    );
  }

  Future<void> getCartProducts() async {
    final result = await cartRepo.getAllProductswithQuantity();
    result.fold(
      (l) {
        emit(GetFromCartFailure(errMessage: l.errmessage));
      },
      (r) {
        emit(GetFromCartSuccsess(products: r, totalPrice: getTotalPrice(r)));
      },
    );
  }

  double getTotalPrice(List<CartModel> products) {
    double totalPrice = 0.0;
    for (CartModel product in products) {
      totalPrice += num.parse(product.productsModel.price!);
    }
    print("=" * 20);
    print(totalPrice);
    return totalPrice;
  }

  Future<void> deleteCartItem({required String productId}) async {
    final result = await homeRepo.deleteProductFromCollection(
      collectionName: "cart",
      productId: productId,
      subCollectionName: "products",
    );
    result.fold(
      (l) {
        emit(DeleteCartItemFailure(errMessage: l.errmessage));
      },
      (r) {},
    );
  }

  Future<void> deleteAllCartItems({required List<ProductsModel> cartItems}) async {
    final batch = FirebaseFirestore.instance.batch();
    final userCartRef = FirebaseFirestore.instance
        .collection("cart")
        .doc(auth.currentUser!.uid);
    for (final cartItem in cartItems) {
      final productId = cartItem.id; // Assuming this is the ID of the product
      final productRef = userCartRef.collection("products").doc(productId);
      batch.delete(productRef);
    }
    await batch.commit();
  }
}
