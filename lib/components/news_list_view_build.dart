import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_news_app/components/news_list_view.dart';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/services/news_service.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsService(Dio()).getTopHeadlines(
      category: widget.category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, Snapshot) {
          if (Snapshot.hasData) {
            return NewsListView(
              articles: Snapshot.data!,
            );
          } else if (Snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: errorMsg(),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}

class errorMsg extends StatelessWidget {
  const errorMsg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('oops there was an error');
  }
}
