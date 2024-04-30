import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/app/core/errors/firebase_faliure.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/errors/faliure.dart';
import '../../models/Products_Model.dart';
import 'product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final auth = FirebaseAuth.instance;
  final dataBase = FirebaseFirestore.instance;
  @override
  Future<Either<Faliures, void>> uploadProducts(
      {required String productImageUrl,
      required String name,
      required String descreption,
      required String category,
      required String price}) async {
    try {
      final product = dataBase.collection("products").doc();
      ProductsModel productsModel = ProductsModel(
          id: product.id,
          vendorId: auth.currentUser!.uid,
          category: category,
          name: name,
          price: price,
          imageUrl: productImageUrl,
          description: descreption);
      await product.set(productsModel.toJson());
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }

  @override
  Future<Either<Faliures, List<ProductsModel>>>
      getUserUploadedProducts() async {
    try {
      final product = await dataBase
          .collection("products")
          .where("vendorId", isEqualTo: auth.currentUser!.uid)
          .get();
      List<ProductsModel> productsList = [];
      for (var element in product.docs) {
        productsList.add(ProductsModel.fromJson(map: element.data()));
      }
      return Right(productsList);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }
}
