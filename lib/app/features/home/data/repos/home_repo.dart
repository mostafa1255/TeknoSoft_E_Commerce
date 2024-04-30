import 'package:dartz/dartz.dart';
import 'package:e_commerce/app/core/errors/faliure.dart';
import '../../../../core/utils/enums.dart';
import '../../../upload_product/data/models/Products_Model.dart';

abstract class HomeRepo {
  Future<Either<Faliures, List<ProductsModel>>> getProductsFromCollection(
      {required String collectionName});

  Future<Either<Faliures, List<ProductsModel>>> getAllProducts();

  Future<Either<Faliures, Appstate>> addProductToCollection({
    required String collectionName,
    required ProductsModel productsModel,
  });
  Future<Either<Faliures, void>> deleteProductFromCollection({
    required String collectionName,
    required String subCollectionName,
    required String productId,
  });
  Future<Either<Faliures, List<ProductsModel>>> getLatestProducts();
}
