import 'package:flutter/material.dart';
import 'package:new_app/models/source_response/source.dart';
import 'package:new_app/news/news_list.dart';
import 'package:new_app/tabs/tab_item.dart';

class SourcesTabs extends StatefulWidget {
  const SourcesTabs({super.key, required this.sources});
  final List<Source> sources;
  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  bool isSelected = false;
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
              onTap: (index) => setState(() {
                    selectedTabIndex = index;
                  }),
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabs: widget.sources
                  .map((source) => TabItem(
                        source: source.name ?? " ",
                        isSelected:
                            selectedTabIndex == widget.sources.indexOf(source)
                                ? !isSelected
                                : isSelected,
                      ))
                  .toList()),
        ),
        Expanded(
            child:
                NewsList(soursceId: widget.sources[selectedTabIndex].id ?? ""))
      ],
    );
  }
}
