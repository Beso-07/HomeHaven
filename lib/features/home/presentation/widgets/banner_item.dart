import 'package:flutter/material.dart';
import 'package:homehaven/features/home/data/models/banner_model/banner_model.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key, required this.bannerModel});
  final BannerModel bannerModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Image.network(
        bannerModel.image ??
            'https://media.istockphoto.com/id/827247322/vector/danger-sign-vector-icon-attention-caution-illustration-business-concept-simple-flat-pictogram.jpg?s=612x612&w=0&k=20&c=BvyScQEVAM94DrdKVybDKc_s0FBxgYbu-Iv6u7yddbs=',
        fit: BoxFit.cover,
      ),
    );
  }
}
