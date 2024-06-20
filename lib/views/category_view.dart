import 'package:flutter/material.dart';
import 'package:my_news_app/components/news_list_view_build.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        NewsListViewBuilder(category: category),
      ],
    ));
  }
}
