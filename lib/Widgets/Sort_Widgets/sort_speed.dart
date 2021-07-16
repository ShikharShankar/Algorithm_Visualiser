import 'package:algorithm_visualizer/Providers/Sort_Providers/sort_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortSpeed<T extends SortProvider> extends StatelessWidget {
  const SortSpeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Text('Sort Speed', style: Theme.of(context).textTheme.caption),
        Selector<T, double>(
          selector: (context, provider) => provider.executionSpeed,
          builder: (context, executionSpeed, child) {
            return Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Slider(
                value: executionSpeed,
                onChanged: (value) => Provider.of<T>(context, listen: false)
                    .executionSpeed = value,
              ),
            );
          },
        ),
      ],
    );
  }
}