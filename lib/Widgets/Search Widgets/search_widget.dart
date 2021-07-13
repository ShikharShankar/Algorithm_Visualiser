import 'package:algorithm_visualizer/Models/search_model.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, required this.number}) : super(key: key);

  final SearchModel number;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: number.state,
      builder: (context, state, child) {
        double fontSize = 20;
        if (state == SearchState.search)
          fontSize = 42;
        else if (state == SearchState.found)
          fontSize = 42;
        else if (state == SearchState.searched) fontSize = 20;

        return AnimatedContainer(
          key: number.key,
          duration: const Duration(milliseconds: 900),
          curve: Curves.ease,
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: (state == SearchState.found) ? Border.all(color: Colors.green) : null,
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          ),
          child: CustomTextStyle(
            fontSize: fontSize,
            number: number,
            numberValue: number.value.toString(),
            state: state as SearchState,
          ),
        );
      },
    );
  }
}

class CustomTextStyle extends StatelessWidget {
  final double fontSize;
  final SearchModel number;
  final String numberValue;
  final SearchState state;

  const CustomTextStyle(
      {Key? key,
      required this.fontSize,
      required this.number,
      required this.numberValue,
      required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      child: Center(
        child: Text(numberValue),
      ),
      curve: Curves.easeOut,
      style: TextStyle(
        fontSize: fontSize,
        decoration: (state == SearchState.discard)
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        decorationStyle: TextDecorationStyle.solid,
        decorationThickness: 1.7,
        color: number.color,
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}
