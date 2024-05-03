import 'package:bloc/bloc.dart';
import 'package:e_commerce/app/features/home/data/repos/home_repo.dart';
import 'package:e_commerce/app/features/upload_product/data/models/Products_Model.dart';
import 'package:meta/meta.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit({required this.homeRepo}) : super(OrderInitial());
  HomeRepo homeRepo;

  Future<void> putAllOrdersProducts(
      {required List<ProductsModel> productsModel}) async {
    emit(OrderLoading());
    for (var element in productsModel) {
      var result = await homeRepo.addProductToCollection(
          collectionName: "orders", productsModel: element);
      result.fold((l) => emit(OrderError(errMessage: l.errmessage)), (r) {
        emit(OrderLoaded());
      });
    }
  }

  Future<void> getAllOrdersProducts() async {
    emit(OrderLoading());
    var result =
        await homeRepo.getProductsFromCollection(collectionName: "orders");
    result.fold(
        (l) => emit(OrderGetAllProductsFailure(errMessage: l.errmessage)), (r) {
      emit(OrderGetAllProductsSuccsess(products: r));
    });
  }
}
