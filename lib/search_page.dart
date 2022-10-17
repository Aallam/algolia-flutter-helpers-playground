import 'package:flutter/material.dart';

import 'search_box.dart';
import 'search_filters.dart';
import 'search_hits.dart';
import 'search_stats.dart';
import 'styling.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Styling.isLargeScreen(context) ? desktopView() : handsetView();

  Widget desktopView() {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 1280,
        height: 720,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            elevation: 0.0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [Card(child: SearchBox()), SearchStats()],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 268,
                  child: Column(
                    children: const [
                      Expanded(flex: 1, child: Card(child: CategoriesFacets())),
                      Expanded(flex: 1, child: Card(child: BrandsFacets())),
                    ],
                  ),
                ),
                const Flexible(child: SearchHits())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget handsetView() {
    return Scaffold(
      appBar: AppBar(title: const SearchBox()),
      drawer: Drawer(
          child: Column(
        children: const [
          Expanded(flex: 1, child: Card(child: CategoriesFacets())),
          Expanded(flex: 1, child: Card(child: BrandsFacets())),
        ],
      )),
      body: const SearchHits(),
    );
  }
}
