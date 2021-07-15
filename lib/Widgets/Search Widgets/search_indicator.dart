import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:algorithm_visualizer/Providers/Search_Providers/search_provider.dart';
import 'package:algorithm_visualizer/Models/search_model.dart';
import 'package:after_layout/after_layout.dart';

class SearchIndicator<T extends SearchProvider> extends StatefulWidget {
  final GlobalKey parentKey;

  const SearchIndicator({Key? key, required this.parentKey}) : super(key: key);

  @override
  _SearchIndicatorState<T> createState() => _SearchIndicatorState<T>();
}

class _SearchIndicatorState<T extends SearchProvider> extends State<SearchIndicator<T>> {

  var _position = Offset.zero;


  @override

  void afterFirstLayout(BuildContext context) {
    final numbers = Provider.of<T>(context, listen: false).numbers;
    setState(() {
      _position = _getIndicatorOffset(numbers[numbers.length ~/ 2]);
    });
  }

  Offset _getIndicatorOffset(SearchModel number) {
    var pos = Offset.zero;

    try {
      final RenderBox rObject = number.key.currentContext!.findRenderObject() as RenderBox;
      final RenderBox parentObject = widget.parentKey.currentContext!.findRenderObject() as RenderBox;
      final parentPos = parentObject.localToGlobal(const Offset(0, 0));
      pos = -rObject.globalToLocal(parentPos);
    } catch (error) {
      print(error);
    }

    return pos;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, searchProvider, child) {
        for (var number in searchProvider.numbers) {
          if (number.state.value == SearchState.search) {
            _position = _getIndicatorOffset(number);
            break;
          }
        }
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
          left: _position.dx,
          right: _position.dy,
          child: Visibility(
            visible: searchProvider.isSearching,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
