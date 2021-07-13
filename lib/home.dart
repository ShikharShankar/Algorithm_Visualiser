import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:algorithm_visualizer/Providers/pages_provider.dart';
import 'package:algorithm_visualizer/category_switcher.dart';
import 'package:algorithm_visualizer/configuration_widget.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => PagesProvider(),
        child: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ConfigurationWidget(),
        Expanded(
          child: CategorySwitcher(),
        ),
      ],
    );
  }
}
