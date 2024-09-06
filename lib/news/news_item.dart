import 'package:flutter/material.dart';
import 'package:new_app/app_theme.dart';
import 'package:new_app/models/news_response/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.news});
  final Article news;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              news.urlToImage ?? "",
              height: MediaQuery.of(context).size.height * .25,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(news.source?.name ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 18, color: AppTheme.grey)),
          const SizedBox(
            height: 4,
          ),
          Text(
            news.title ?? "",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppTheme.navy),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                timeago.format(news.publishedAt??DateTime.now()),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppTheme.navy),
              ))
        ],
      ),
    );
  }
}
