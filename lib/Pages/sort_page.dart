import 'package:algorithm_visualizer/Providers/Sort_Providers/sort_provider.dart';
import 'package:algorithm_visualizer/Widgets/Sort_Widgets/sort_speed.dart';
import 'package:algorithm_visualizer/Widgets/Sort_Widgets/sort_visualization.dart';
import 'package:algorithm_visualizer/Widgets/Sort_Widgets/sort_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class SortPage<T extends SortProvider> extends StatelessWidget {
  const SortPage({Key? key, required this.title, this.blockSize = 100})
      : assert(title != null),
        super(key: key);

  final String title;
  final double blockSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Text(title, style: Theme.of(context).textTheme.headline4),
              ),
              //Cannot be const
              Container(
                  height: 400,
                  width: constraints.maxWidth,
                  child: Center(
                    child: SortVisualizer<T>(
                      blockSize: blockSize,
                      width: constraints.maxWidth,
                    ),
                  ),
              ),
              SortSpeed<T>(),
              SortButton<T>(),
            ],
          ),
        ),
      );
    });
    // return
  }
}