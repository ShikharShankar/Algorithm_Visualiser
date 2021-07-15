import 'package:algorithm_visualizer/Models/search_model.dart';
import 'package:algorithm_visualizer/Providers/Search_Providers/search_provider.dart';
import 'package:algorithm_visualizer/Widgets/Search%20Widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchVisualizer<T extends SearchProvider> extends StatelessWidget {
  const SearchVisualizer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Selector<T, List<SearchModel>>(
              selector: (context, provider) => provider.numbers,
              builder: (_, numbers, __) {
                return Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    for (var number in numbers)
                      SearchWidget(
                        number: number,
                      )
                  ],
                );
              },
            ),
    );
  }
}