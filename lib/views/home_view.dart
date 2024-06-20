import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_news_app/components/News_list_view.dart';
import 'package:my_news_app/components/categories_list_view.dart';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/services/news_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News ',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Hub ',
              style: TextStyle(color: Colors.orange),
            )
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoriesListView()),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 30,
            )),
            NewsListViewBuilder(
             
            ),
          ],
        ),
        // child: Column(
        //   children: [
        //     categoriesListView(),
        //     SizedBox(
        //       height: 30,
        //     ),
        //     Expanded(child: NewsListView()),
        //   ],
        // ),
      ),
    );
  }
}

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  List<ArticleModel> articles = [];
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final fetchedArticles = await NewsService(Dio()).getTopHeadlines(
      category: 'general',
    );
    isloading = false;

    setState(() {
      articles = fetchedArticles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? SliverToBoxAdapter(
            child: Center(child: const CircularProgressIndicator()))
        : NewsListView(
            articles: articles,
          );
  }
}
