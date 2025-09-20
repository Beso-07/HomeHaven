import 'package:flutter/material.dart';
import 'package:homehaven/features/home/data/models/product_model/product_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.network(productModel.image!, width: 80),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              productModel.name!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              productModel.description!,
              style: TextStyle(fontSize: 12, color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "\$ ${productModel.price}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(width: 5),
                Text(
                  "\$50.32",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 16,
                  child: Icon(Icons.add, color: Colors.white, size: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
