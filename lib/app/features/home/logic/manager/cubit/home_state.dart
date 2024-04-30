part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

class HomeInitial extends HomeState {}

class FetchingAllProducts extends HomeState {}

class AllProductsFetched extends HomeState {
  final List<ProductsModel> products;
  AllProductsFetched({required this.products});
}

class FetchingLatestProducts extends HomeState {}

class LatestProductsFetched extends HomeState {
  final List<ProductsModel> products;
  LatestProductsFetched({required this.products});
}

class ErrorFetchingAllProducts extends HomeState {
  final String errMessage;
  ErrorFetchingAllProducts({required this.errMessage});
}

class ErrorFetchingLatestProducts extends HomeState {
  final String errMessage;
  ErrorFetchingLatestProducts({required this.errMessage});
}

class FetchingProductsByCategory extends HomeState {}

class ProductsByCategoryFetched extends HomeState {
  final List<ProductsModel> products;
  ProductsByCategoryFetched({required this.products});
}

class ErrorFetchingProductsByCategory extends HomeState {
  final String errMessage;
  ErrorFetchingProductsByCategory({required this.errMessage});
}
