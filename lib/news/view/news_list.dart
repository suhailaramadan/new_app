import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/news/view/news_item.dart';
import 'package:new_app/news/view_model/new_view_model.dart';
import 'package:new_app/news/view_model/news_states.dart';
import 'package:new_app/shared/widget/error_indicator.dart';
import 'package:new_app/shared/widget/loading_indicator.dart';
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
    BlocProvider.of<NewsViewModel>(context);
    viewModel.getNews(widget.soursceId);
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<NewsViewModel,NewsStates>(
        builder: (context,state) {
          if (state is GetNewsLoading) {
            return const LoadingIndicator();
          } else if (state is GetNewsError) {
            return ErrorIndicator(
              onPressed: (_) => viewModel.getNews(widget.soursceId),
              errorMessage:state.errorMessage,
            );
          } else if(state is GetNewsSuccess) {
            return ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, index) =>
                  NewsItem(news: state.news[index]),
            );
          }else{
            return const SizedBox();
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
