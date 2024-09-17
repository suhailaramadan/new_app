// import 'package:flutter/material.dart';
// // import 'package:new_app/api/api_service.dart';
// import 'package:new_app/shared/app_theme.dart';
// import 'package:new_app/home/view/screens/home_screen.dart';
// import 'package:new_app/news/view/news_item.dart';
// import 'package:new_app/shared/widget/error_indicator.dart';
// import 'package:new_app/shared/widget/loading_indicator.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class SearchTab extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             showResults(context);
//           },
//           icon: Icon(Icons.search))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//         icon: Icon(Icons.close));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return buildSuggestions(context);
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     if (query.isEmpty) {
//       return Center(
//           child: Text(
//         AppLocalizations.of(context)!.suggest,
//         style: Theme.of(context)
//             .textTheme
//             .titleLarge
//             ?.copyWith(color: AppTheme.black),
//       ));
//     }
//     return FutureBuilder(
//       future: APIService.getNews(query: query),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const LoadingIndicator();
//         } else if (snapshot.hasError || snapshot.data?.status != "ok") {
//           return ErrorIndicator(
//               onPressed: (_) => APIService.getNews(query: query));
//         } else {
//           final newsList = snapshot.data!.articles ?? [];
//           return ListView.builder(
//             itemBuilder: (_, index) => NewsItem(
//               news: newsList[index],
//             ),
//             itemCount: newsList.length,
//           );
//         }
//       },
//     );
//   }

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     return ThemeData(
//       appBarTheme: const AppBarTheme(
//         backgroundColor: AppTheme.primary,
//         foregroundColor: AppTheme.white,
//         titleTextStyle: TextStyle(color: AppTheme.white),
//         toolbarHeight: 80,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(32),
//               bottomRight: Radius.circular(32)),
//         ),
//       ),
//       inputDecorationTheme: const InputDecorationTheme(
//           enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
//           focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
//           activeIndicatorBorder: BorderSide.none),
//     );
//   }
// }
