import 'package:flutter/material.dart';
import 'package:new_app/news/view/news_item.dart';
import 'package:new_app/news/view_model/new_view_model.dart';
import 'package:new_app/shared/widget/error_indicator.dart';
import 'package:new_app/shared/widget/loading_indicator.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.soursceId});
  final String soursceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();
  // int page = 1;

  // int pageSize = 5;

  // final controller = ScrollController();
  // @override
  // void initState() {
  //   super.initState();
  //   controller.addListener(() {
  //     if(controller.offset!=0){
  //       setState(() {
  //         page++;
  //         controller.animateTo(0, duration:Duration(milliseconds: 300) , curve: Curves.easeInOut);
  //       });
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.soursceId);
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context,viewModel, child) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(
              onPressed: (_) => viewModel.getNews(widget.soursceId),
              errorMessage: viewModel.errorMessage!,
            );
          } else {
            return ListView.builder(
              itemCount: viewModel.newsList.length,
              itemBuilder: (context, index) =>
                  NewsItem(news: viewModel.newsList[index]),
            );
          }
        },
      ),
    );
    // FutureBuilder(
    //   future: APIService.getNews(
    //       categoryId: widget.soursceId, page: page, pageSize: pageSize),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const LoadingIndicator();
    //     } else if (snapshot.hasError || snapshot.data?.status != "ok") {
    //       return ErrorIndicator(
    //         onPressed: (_) => APIService.getNews(categoryId: widget.soursceId),
    //         sourceId: widget.soursceId,
    //       );
    //     } else {
    //       final newsList = snapshot.data!.articles ?? [];
    //       return RefreshIndicator(
    //         onRefresh: () async {
    //           setState(() {
    //             page = 1;
    //           });
    //         },
    //         child: ListView.builder(
    //           controller: controller,
    //           itemBuilder: (_, index) => NewsItem(
    //             news: newsList[index],
    //           ),
    //           itemCount: newsList.length,
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
