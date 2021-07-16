import 'package:algorithm_visualizer/Pages/sort_page.dart';
import 'package:algorithm_visualizer/Providers/Search_Providers/binary_search_provider.dart';
import 'package:algorithm_visualizer/Providers/Search_Providers/jump_search_provider.dart';
import 'package:algorithm_visualizer/Providers/Search_Providers/linear_search_provider.dart';
import 'package:algorithm_visualizer/Pages/search_page.dart';
import 'package:algorithm_visualizer/Providers/Sort_Providers/bubble_sort_provider.dart';
import 'package:flutter/material.dart';

class PagesProvider extends ChangeNotifier {
  String categoryKey = 'Search';

  final _searchPages = [
    SearchPage<LinearSearchProvider>(title: 'Linear Search'),
    SearchPage<BinarySearchProvider>(title: 'Binary Search'),
    SearchPage<JumpSearchProvider>(title: 'Jump Search'),
  ];

  final _sortPages = [
    const SortPage<BubbleSortProvider>(title: 'Bubble Sort'),
  ];

  void changeKey(String key) {
    categoryKey = key;
    notifyListeners();
  }

  List<StatelessWidget> get pages {
    switch (categoryKey) {
      case 'Search':
        return _searchPages;
        break;
      case 'Sort':
        return _sortPages;
        break;
      default:
        return _searchPages;
        break;
    }
  }
}