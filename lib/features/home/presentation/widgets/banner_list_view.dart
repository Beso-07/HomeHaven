import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homehaven/features/home/presentation/views_model/banner_cubit/banner_cubit.dart';
import 'package:homehaven/features/home/presentation/widgets/banner_item.dart';

class BannerListView extends StatelessWidget {
  const BannerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannerCubit()..gatBanners(),
      child: BlocBuilder<BannerCubit, BannerState>(
        builder: (context, state) {
          if (state is BannerSuccess) {
            return CarouselSlider.builder(
              itemCount: state.banners.length,
              itemBuilder: (
                BuildContext context,
                int index,
                int pageViewIndex,
              ) {
                return BannerItem(bannerModel: state.banners[index]);
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 1.5,
              ),
            );
          } else if (state is BannerFailure) {
            return Center(child: Text(state.errMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
