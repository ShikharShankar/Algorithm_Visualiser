import 'package:algorithm_visualizer/Providers/Search_Providers/binary_search_provider.dart';
import 'package:algorithm_visualizer/Providers/Search_Providers/jump_search_provider.dart';
import 'package:algorithm_visualizer/Providers/Search_Providers/linear_search_provider.dart';
import 'package:algorithm_visualizer/Pages/search_page.dart';
import 'package:flutter/material.dart';

class PagesProvider extends ChangeNotifier {
  String categoryKey = 'Search';

  final _searchPages = [
    SearchPage<LinearSearchProvider>(title: 'Linear Search'),
    SearchPage<BinarySearchProvider>(title: 'Binary Search'),
    SearchPage<JumpSearchProvider>(title: 'Jump Search'),
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
      default:
        return _searchPages;
        break;
    }
  }
}