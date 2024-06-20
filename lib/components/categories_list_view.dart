import 'package:flutter/material.dart';
import 'package:my_news_app/components/category_card.dart';
import 'package:my_news_app/models/category_model.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });
  final List<CategoryModel> categories = const [
    CategoryModel(categoryName: 'sports', imageAsset: 'assets/sports.jpg'),
    CategoryModel(categoryName: 'health', imageAsset: 'assets/health.jpg'),
    CategoryModel(categoryName: 'science', imageAsset: 'assets/science.jpg'),
    CategoryModel(categoryName: 'business', imageAsset: 'assets/business.jpg'),
    CategoryModel(categoryName: 'entertaiment', imageAsset: 'assets/entertaiment.jpg'),
    CategoryModel(categoryName: 'general', imageAsset: 'assets/general.jpg'),
    CategoryModel(categoryName: 'technology', imageAsset: 'assets/technology.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return  CategoryCard(
              category: categories[index],
            );
          }),
    );
  }
}
