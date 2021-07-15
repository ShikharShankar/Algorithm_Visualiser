import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:algorithm_visualizer/Providers/Search_Providers/search_provider.dart';

class SearchMessage<T extends SearchProvider> extends StatefulWidget {
  const SearchMessage({Key? key}) : super(key: key);

  @override
  _SearchMessage<T> createState() => _SearchMessage<T>();
}

class _SearchMessage<T extends SearchProvider> extends State<SearchMessage<T>> {
  var _fontSize = 16.0;
  var _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Selector<T, int>(
        selector: (_, provider) => provider.position,
        builder: (_, position, __) {
          String outputMessage;
          if (position == -2) {
            outputMessage = '';
            _fontSize = 0;
            _color = Colors.black;
          } else if (position == -1) {
            outputMessage = 'Value not found';
            _fontSize = 24;
            _color = Colors.red;
          } else {
            outputMessage =
            'Value found at position: ${(position + 1).toString()}';
            _fontSize = 24;
            _color = Colors.black;
          }
          return Container(
            height: 50,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 400),
              curve: Curves.ease,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: _fontSize,
                color: _color,
              ),
              child: Text(
                outputMessage,
              ),
            ),
          );
        });
  }
}
