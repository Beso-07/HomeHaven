import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homehaven/core/helpers/dio_helper.dart';
import 'package:homehaven/features/home/data/models/category_model/category_model.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void getAllCategories() async {
    emit(CategoryLoading());
    try {
      final response = await DioHelper.getData(path: 'categories');

      if (response.statusCode == 200) {
        final categoriesJson = response.data['data'] as List;
        final categories =
            categoriesJson.map((e) => CategoryModel.fromJson(e)).toList();

        emit(CategorySuccess(categories: categories));
      } else {
        emit(CategoryFailure(errMessage: 'Error: ${response.statusCode}'));
      }
    } catch (e) {
      emit(CategoryFailure(errMessage: e.toString()));
    }
  }
}
