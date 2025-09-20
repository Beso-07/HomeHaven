import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homehaven/features/home/presentation/views_model/get_all_products_cubit/get_all_products_cubit.dart';
import 'package:homehaven/features/home/presentation/widgets/product_item.dart';

class ProductListViewItems extends StatelessWidget {
  const ProductListViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllProductsCubit()..getAllProducts(),
      child: BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
        builder: (context, state) {
          if (state is GetAllProductsSuccess) {
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: .6,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductItem(productModel: state.products[index]);
              },
            );
          } else if (state is GetAllProductsFailure) {
            return Center(child: Text(state.errMessage));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
