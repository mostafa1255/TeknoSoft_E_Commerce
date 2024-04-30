import 'package:dartz/dartz.dart';
import 'package:e_commerce/app/features/upload_product/data/models/Products_Model.dart';
import '../../../../../core/errors/faliure.dart';

abstract class ProductRepo {
  Future<Either<Faliures, void>> uploadProducts(
      {required String productImageUrl,
      required String name,
      required String descreption,
      required String category,
      required String price});

  Future<Either<Faliures, List<ProductsModel>>> getUserUploadedProducts();
}
