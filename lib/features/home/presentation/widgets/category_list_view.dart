import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homehaven/features/home/presentation/views_model/category_cubit/category_cubit.dart';
import 'package:homehaven/features/home/presentation/widgets/category_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getAllCategories(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategorySuccess) {
            return SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return CategoryItem(categoryModel: state.categories[index]);
                },
              ),
            );
          } else if (state is CategoryFailure) {
            return Center(child: Text(state.errMessage));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
