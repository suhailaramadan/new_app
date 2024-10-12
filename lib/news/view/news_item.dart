import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_app/shared/app_theme.dart';
import 'package:new_app/news/data/model/news_response/news.dart';
import 'package:new_app/news/view/news_details.dart';
import 'package:new_app/shared/widget/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child:CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              placeholder:(context, url) => const LoadingIndicator(),
              errorWidget:(context, url, error) =>const Icon(Icons.image_not_supported_outlined,size: 40,),
              // (context, error, stackTrace) => Container(
              //   color: Colors.grey[200],
              //   padding: const EdgeInsets.all(10),
              //   height: MediaQuery.of(context).size.height * .25,
              //   width: double.infinity,
              //   child: const Center(
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Icon(
              //           Icons.error,
              //           color: AppTheme.red,
              //         ),
              //         Text("No image !")
              //       ],
              //     ),
              //   ),
              // ),
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
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(NewsDetails.routeName, arguments: news);
            },
            child: Text(
              news.title ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppTheme.navy),
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                timeago.format(news.publishedAt ?? DateTime.now()),
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
