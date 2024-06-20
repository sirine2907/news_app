import 'package:flutter/material.dart';
import 'package:my_news_app/models/article_model.dart';

class NewsTile extends StatelessWidget {
  final ArticleModel article;

  const NewsTile({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            article.image ?? '',  // Use a placeholder or empty string if image is null
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                color: Colors.grey,
                child: Icon(Icons.error, color: Colors.white),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Text(
          article.title ?? '',  // Ensure title is not null
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          article.subTitle ?? '',  // Ensure subtitle is not null
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
