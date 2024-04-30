import 'package:bloc/bloc.dart';
import 'package:e_commerce/app/features/upload_product/data/models/Products_Model.dart';
import 'package:meta/meta.dart';
import '../../../data/repos/home_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());
  HomeRepo homeRepo;
  Future<void> getAllProducts() async {
    emit(FetchingAllProducts());
    final result = await homeRepo.getAllProducts();
    result.fold(
      (l) => emit(ErrorFetchingAllProducts(errMessage: l.errmessage)),
      (r) => emit(AllProductsFetched(products: r)),
    );
  }

  Future<void> getLatestProducts() async {
    emit(FetchingLatestProducts());
    final result = await homeRepo.getLatestProducts();
    result.fold(
      (l) => emit(ErrorFetchingLatestProducts(errMessage: l.errmessage)),
      (r) => emit(LatestProductsFetched(products: r)),
    );
  }

  Future<void> getProductByCategory({required String category}) async {
    emit(FetchingProductsByCategory());
    final result = await homeRepo.getAllProducts();
    List<ProductsModel> products = [];
    result.fold(
      (l) => emit(ErrorFetchingProductsByCategory(errMessage: l.errmessage)),
      (r) {
        for (var element in r) {
          if (element.category == category) {
            products.add(element);
          }
        }
        if (products.isEmpty) {
          emit(
              ErrorFetchingProductsByCategory(errMessage: "No Products Found"));
        } else {
          emit(ProductsByCategoryFetched(products: products));
        }
      },
    );
  }
}
