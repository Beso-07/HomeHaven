import 'package:flutter/material.dart';
import 'package:homehaven/features/home/presentation/widgets/category_list_view.dart';
import 'package:homehaven/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:homehaven/features/home/presentation/widgets/banner_list_view.dart';
import 'package:homehaven/features/home/presentation/widgets/product_list_view_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: height * .005,
            left: width * .01,
            right: width * .04,
          ),
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: width * .02),
              BannerListView(),
              SizedBox(height: width * .02),
              Row(
                children: [
                  Text(
                    'Explore Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: width * .02),

              CategoryListView(),
              SizedBox(height: width * .01),
              Row(
                children: [
                  Text(
                    'Popular Pack',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  InkWell(
                    child: Text(
                      'View All',
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                  ),
                ],
              ),
              SizedBox(height: width * .01),
              ProductListViewItems(),
            ],
          ),
        ),
      ),
    );
  }
}
