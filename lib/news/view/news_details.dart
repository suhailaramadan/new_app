import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_app/shared/app_theme.dart';
import 'package:new_app/news/data/model/news_response/news.dart';
import 'package:new_app/shared/widget/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:enhanced_url_launcher/enhanced_url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const routeName = "/newsDetaila";
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as News;
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
          appBar: AppBar(
            title: Text(news.source!.name ?? ""),
          ),
          body: SingleChildScrollView(
            child: Center(
                child: Padding(
                    padding: const EdgeInsetsDirectional.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: Image.network(
                                news.urlToImage ?? "",
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return const LoadingIndicator();
                                  }
                                },
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                  color: Colors.grey[200],
                                  padding: const EdgeInsets.all(10),
                                  height:
                                      MediaQuery.of(context).size.height * .25,
                                  width: double.infinity,
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.error,
                                          color: AppTheme.red,
                                        ),
                                        Text("No image !")
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(news.source!.name ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontSize: 18, color: AppTheme.grey)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            news.title ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: AppTheme.navy),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: Text(
                              timeago
                                  .format(news.publishedAt ?? DateTime.now()),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: AppTheme.navy,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            color: AppTheme.white,
                            child: Column(
                              children: [
                                Text(
                                  news.description ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: AppTheme.navy, fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                    onTap: () async {
                                      if (await canLaunchUrl(
                                          Uri.parse(news.url ?? ""))) {
                                        await launchUrl(
                                            Uri.parse(news.url ?? ""));
                                      } else {
                                        throw "can't lanch ${news.url}";
                                      }
                                    },
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text("View Full Article",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                    color: AppTheme.blue))))
                              ],
                            ),
                          ),
                        ]))),
          )),
    );
  }
}
