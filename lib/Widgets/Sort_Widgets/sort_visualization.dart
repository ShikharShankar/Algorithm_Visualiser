import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:algorithm_visualizer/Providers/Sort_Providers/sort_provider.dart';
import 'package:algorithm_visualizer/Widgets/Sort_Widgets/sort_widget.dart';

class SortVisualizer<T extends SortProvider> extends StatelessWidget {
  const SortVisualizer({
    Key? key,
    this.blockSize = 100,
    required this.width,
  }) : super(key: key);

  final double blockSize;
  final double width;

  double _getHeight(double width, int numOfWidgets) {
    final horizontalFit = width ~/ blockSize;
    final rows = (numOfWidgets / horizontalFit).ceil();
    return rows * blockSize;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<T>(
        builder: (_, provider, __) {
          return SizedBox(
            width: width,
            height: _getHeight(
              width,
              provider.numbers.length,
            ),
            child: Stack(
              children: <Widget>[
                for (var i = 0; i < provider.numbers.length; i++)
                  SortWidget(
                    key: provider.numbers[i].key,
                    number: provider.numbers[i],
                    index: i,
                    widgetSize: blockSize,
                    containerWidth: width,
                  )
              ],
            ),
          );
        },
      ),
    );
    // child:
  }
}