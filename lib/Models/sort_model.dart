import 'package:flutter/material.dart';

enum SortState {
  open,
  sort,
  sorted,
  pivot,
}

class SortModel {

  final int value;
  final GlobalKey key;
  late SortState state;
  late Color color;

  SortModel(this.value) : key = GlobalKey() {
    state = SortState.open;
    color = Colors.black54;
  }

  void reset() {
    state = SortState.open;
    color = Colors.black54;
  }

  void sort() {
    state = SortState.sort;
    color = Colors.blue;
  }

  void sorted() {
    state = SortState.sorted;
    color = Colors.green;
  }

  void pivot() {
    state = SortState.pivot;
    color = Colors.pink;
  }
}