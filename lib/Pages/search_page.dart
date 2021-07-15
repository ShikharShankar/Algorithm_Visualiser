import 'package:algorithm_visualizer/Providers/Search_Providers/search_provider.dart';
import 'package:algorithm_visualizer/Widgets/Search%20Widgets/search.dart';
import 'package:algorithm_visualizer/Widgets/Search%20Widgets/search_indicator.dart';
import 'package:algorithm_visualizer/Widgets/Search%20Widgets/search_message.dart';
import 'package:algorithm_visualizer/Widgets/Search%20Widgets/search_speed.dart';
import 'package:algorithm_visualizer/Widgets/Search%20Widgets/search_visualization.dart';
import 'package:flutter/material.dart';

class SearchPage<T extends SearchProvider> extends StatelessWidget {

  final String title;

  // const SearchPage({Key? key,required this.title}) : super(key: key);

  SearchPage({Key? key, required this.title})
      : assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey key=GlobalKey(debugLabel:title);

    return SingleChildScrollView(
      child: Stack(
        key: key,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Text(
                  title,
                  style:Theme.of(context).textTheme.headline4,
                ),
              ),
              const SizedBox(height: 24),
              //Below can not be constant
              Container(
                height: 100,
                child: SearchVisualizer<T>(),
              ),
              // Expanded(
              //   child: SearchVisualizer<T>(),
              // ),
              const SizedBox(height: 150),
              SearchMessage<T>(),
              const SizedBox(height: 10),
              SearchSpeed<T>(),
              Search<T>(),
              const SizedBox(height: 24),
            ],
          ),
          SearchIndicator<T>(
            parentKey: key,
          ),
        ],
      ),
    );
  }
}
