part of 'get_all_products_cubit.dart';

sealed class GetAllProductsState {}

final class GetAllProductsInitial extends GetAllProductsState {}

final class GetAllProductsLoading extends GetAllProductsState {}

final class GetAllProductsFailure extends GetAllProductsState {
  final String errMessage;

  GetAllProductsFailure({required this.errMessage});
}

final class GetAllProductsSuccess extends GetAllProductsState {
  final List<ProductModel> products;

  GetAllProductsSuccess({required this.products});
}
