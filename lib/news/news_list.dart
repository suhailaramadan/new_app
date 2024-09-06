import 'package:flutter/material.dart';
import 'package:new_app/api/api_service.dart';
import 'package:new_app/news/news_item.dart';
import 'package:new_app/widgets/error_indicator.dart';
import 'package:new_app/widgets/loading_indicator.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.soursceId});
  final String soursceId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.getNews(soursceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != "ok") {
          return const ErrorIndicator();
        } else {
          final newsList = snapshot.data!.articles ?? [];
          return ListView.builder(
            itemBuilder: (_, index) => NewsItem(
              news: newsList[index],
            ),
            itemCount: newsList.length,
          );
        }
      },
    );
  }
}
