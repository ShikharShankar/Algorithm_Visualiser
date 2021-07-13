import 'package:algorithm_visualizer/Providers/Search%20Providers/binary_search_provider.dart';
import 'package:algorithm_visualizer/Providers/Search%20Providers/linear_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:algorithm_visualizer/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithm Visualizer',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Scaffold(
        body: SafeArea(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => LinearSearchProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => BinarySearchProvider(),
              ),
            ],
            child: Home(),
          ),
        ),
      ),
    );
  }
}
