import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homehaven/core/helpers/dio_helper.dart';
import 'package:homehaven/features/home/data/models/product_model/product_model.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit() : super(GetAllProductsInitial());

  void getAllProducts() async {
    emit(GetAllProductsLoading());
    try {
      final response = await DioHelper.getData(path: 'products');

      if (response.statusCode == 200) {
        final productsJson = response.data['data']['products'] as List;
        final products =
            productsJson.map((e) => ProductModel.fromJson(e)).toList();

        emit(GetAllProductsSuccess(products: products));
      } else {
        emit(
          GetAllProductsFailure(errMessage: 'Error: ${response.statusCode}'),
        );
      }
    } catch (e) {
      emit(GetAllProductsFailure(errMessage: e.toString()));
    }
  }
}
