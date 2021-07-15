import 'dart:math';

import 'package:algorithm_visualizer/Models/search_model.dart';
import 'package:algorithm_visualizer/Providers/Search_Providers/search_provider.dart';


class JumpSearchProvider extends SearchProvider
{
  @override
  void search({int value = 34}) {
    super.search(value: value);
    _startSearch(numbers, value);
  }

  // Future _startSearch(List<SearchModel> list, int target) async {
  //   for (var index = 0; index < list.length; index++) {
  //     potentialNode(index);
  //     await pause();
  //     if (numbers[index].value == target) {
  //       foundNode(index);
  //       return;
  //     } else {
  //       discardNode(index);
  //     }
  //   }
  //   nodeNotFound();
  // }

  Future _startSearch(List<SearchModel> list, int target) async {
    int jump=(sqrt(list.length)).toInt();
    int prev=0;

    for (var index = 0; index < list.length; index=index+jump) {
      potentialNode(index);
      await pause();

      if (numbers[index].value == target) {
        foundNode(index);
        return;
      }
      else if(numbers[index].value<target) {
        discardNodes(prev, index);
        prev = index;
        await pause();
      }
      else if(numbers[index].value>target) {
        discardNodes(index, list.length-1);
        await pause();
        break;
      }
    }

    for(var index=prev+1;index<prev+jump;index++)
    {
      potentialNode(index);
      await pause();
      if (numbers[index].value == target) {
        foundNode(index);
        return;
      } else {
        discardNode(index);
      }
    }

    nodeNotFound();
  }

}