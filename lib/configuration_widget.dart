import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:algorithm_visualizer/Providers/pages_provider.dart';


class ConfigurationWidget extends StatelessWidget {
  const ConfigurationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _ConfigurationWidget();
  }
}

class _ConfigurationWidget extends StatelessWidget {
  const _ConfigurationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CategorySelector();
  }
}


class CategorySelector extends StatelessWidget {
  const CategorySelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PagesProvider>(
      builder: (_, categoryProvider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              Text('Category:', style: Theme.of(context).textTheme.caption),
            ),
            DropdownButton<String>(
              hint: const Text('Category'),
              value: categoryProvider.categoryKey,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              underline: Container(
                height: 2,
                color: Colors.black87,
              ),
              onChanged: (String? newValue) {
                categoryProvider.changeKey(newValue!);
              },
              items: <String>[
                'Search',
                'Sort',
              ].map<DropdownMenuItem<String>>(
                    (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
          ],
        );
      },
    );
  }
}
