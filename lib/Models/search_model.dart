import 'package:flutter/material.dart';

enum SearchState{
  open,
  discard,
  search,
  searched,
  found,
}

class SearchModel{

  final int value;
  ValueNotifier <SearchState> state;
  Color color;
  GlobalKey key;

  SearchModel(this.value)
      : state = ValueNotifier(SearchState.open),
        color = Colors.black54,
        key = GlobalKey();

  // SearchModel(this.value,this.state,this.color,this.key);

  void reset(){
    state.value=SearchState.open;
    color=Colors.black54;
  }

  void potential() {
    state.value = SearchState.search;
    color = Colors.blue;
  }

  void discard() {
    state.value = SearchState.discard;
    color = Colors.red;
  }

  void found() {
    state.value = SearchState.found;
    color = Colors.green;
  }

  void searched() {
    state.value = SearchState.searched;
  }

}