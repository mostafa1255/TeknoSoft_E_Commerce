import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/app/core/errors/faliure.dart';
import 'package:e_commerce/app/features/home/data/repos/home_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/errors/firebase_faliure.dart';
import '../../../../core/utils/enums.dart';
import '../../../upload_product/data/models/Products_Model.dart';

class HomeRepoImpl extends HomeRepo {
  final dataBase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  ProductsModel? productsModel;

  @override
  Future<Either<Faliures, List<ProductsModel>>> getProductsFromCollection(
      {required String collectionName}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await dataBase
          .collection(collectionName)
          .doc(auth.currentUser!.uid)
          .collection("products")
          .get();
      if (snapshot.docs.isNotEmpty) {
        List<ProductsModel> productsList = [];
        for (var doc in snapshot.docs) {
          productsList.add(ProductsModel.fromJson(map: doc.data()));
        }
        return right(productsList);
      } else {
        print("There are no products in $collectionName");
        return left(
            FirebaseFailure("There are no products in $collectionName"));
      }
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }

  @override
  Future<Either<Faliures, List<ProductsModel>>> getAllProducts() async {
    try {
      final product = await dataBase.collection("products").get();
      List<ProductsModel> productsList = [];
      for (var element in product.docs) {
        productsList.add(ProductsModel.fromJson(map: element.data()));
      }
      print(productsList);
      return right(productsList);
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Faliures, void>> deleteProductFromCollection({
    required String collectionName,
    required String subCollectionName,
    required String productId,
  }) async {
    try {
      await dataBase
          .collection(collectionName)
          .doc(auth.currentUser!.uid)
          .collection(subCollectionName)
          .doc(productId)
          .delete();
      return const Right(null);
    } catch (e) {
      return Left(FirebaseFailure("Failed to delete product"));
    }
  }

  @override
  Future<Either<Faliures, Appstate>> addProductToCollection({
    required String collectionName,
    required ProductsModel productsModel,
  }) async {
    try {
      final productDoc = dataBase
          .collection(collectionName)
          .doc(auth.currentUser!.uid)
          .collection("products")
          .doc(productsModel.id);
      productsModel = ProductsModel(
          id: productsModel.id,
          category: productsModel.category,
          name: productsModel.name,
          price: productsModel.price,
          imageUrl: productsModel.imageUrl,
          vendorId: productsModel.vendorId,
          description: productsModel.description);
      await productDoc.set(productsModel.toJson());
      return right(Appstate.productsUploaded);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(e.code));
    }
  }

  @override
  Future<Either<Faliures, List<ProductsModel>>> getLatestProducts() async {
    try {
      final product = await dataBase.collection("products").get();
      List<ProductsModel> productsList = [];
      for (var element in product.docs) {
        productsList.add(ProductsModel.fromJson(map: element.data()));
      }
      // Shuffle the list
      productsList.shuffle();
      // Take the first 4 elements
      List<ProductsModel> randomProducts = productsList.take(4).toList();
      print(randomProducts);
      return right(randomProducts);
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}
