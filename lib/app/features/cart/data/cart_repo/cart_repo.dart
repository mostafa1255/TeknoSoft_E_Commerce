import 'package:dartz/dartz.dart';
import 'package:e_commerce/app/core/errors/faliure.dart';

import '../../../upload_product/data/models/Products_Model.dart';
import '../models/cart_Model.dart';

abstract class CartRepo {
  Future<Either<Faliures, List<CartModel>>> getAllProductswithQuantity();

  Future<Either<Faliures, void>> addProductWithQuantityToCart({
    required ProductsModel productsModel,
  });
  Future<Either<Faliures, void>> updateQuantityofProduct({required String id,required int quantity});
}
