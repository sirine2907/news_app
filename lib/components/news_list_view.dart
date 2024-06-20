
import 'package:flutter/material.dart';
import 'package:my_news_app/components/news_tile.dart';
import 'package:my_news_app/models/article_model.dart';



class NewsListView  extends StatelessWidget {
 final List<ArticleModel> articles ;
  const NewsListView({super.key , required this.articles});


  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsTile(article: articles[index]
            ),
          );
        },
      ),
    );  
    
  }
}
