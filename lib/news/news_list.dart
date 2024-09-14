import 'package:flutter/material.dart';
import 'package:new_app/api/api_service.dart';
import 'package:new_app/news/news_item.dart';
import 'package:new_app/widgets/error_indicator.dart';
import 'package:new_app/widgets/loading_indicator.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.soursceId});
  final String soursceId;

  // final int page=1;

  // final int pageSize=5;

  // final controller=ScrollController();

  // @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.getNews(categoryId:soursceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else 
        if (snapshot.hasError || snapshot.data?.status != "ok") {
          return  ErrorIndicator(onPressed:(_)=> APIService.getNews( categoryId:soursceId),sourceId: soursceId,);
        } else {
          final newsList = snapshot.data!.articles ?? [];
          return ListView.builder(
            // controller:ScrollController(),
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
