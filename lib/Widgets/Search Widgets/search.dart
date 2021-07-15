import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:algorithm_visualizer/Providers/Search_Providers/search_provider.dart';

class Search<T extends SearchProvider> extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState<T> createState() => _SearchState<T>();
}

class _SearchState<T extends SearchProvider> extends State<Search<T>> {
  final searchController = TextEditingController();

  void _search() {
    try {
      final val = int.parse(searchController.text);
      Provider.of<T>(context, listen: false).search(value: val);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 100,
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              labelText: 'Value',
            ),
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
          ),
        ),

        Selector<T, bool>(
          selector: (_, provider) => provider.isSearching,
          builder: (_, isSearching, child) {
            return ElevatedButton(
              onPressed: isSearching ? null : _search,
              child: const Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
