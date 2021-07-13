import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.pages,
  })  : assert(pages != null),
        super(key: key);

  final List<StatelessWidget> pages;

  @override
  Widget build(BuildContext context) {
    return _CategoryWidget(pages: pages);
  }
}



class _CategoryWidget extends StatelessWidget {

  final List<StatelessWidget> pages;

  const _CategoryWidget({Key? key, required this.pages}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return _AlgorithmCategory(pages: pages);
  }
}

class _AlgorithmCategory extends StatefulWidget {
  const _AlgorithmCategory({
    Key? key,
    required this.pages,
  }) : super(key: key);

  final List<StatelessWidget> pages;

  @override
  _AlgorithmCategoryState createState() => _AlgorithmCategoryState();
}

class _AlgorithmCategoryState extends State<_AlgorithmCategory> {

  PageController pageController = PageController(keepPage: false);

  var page = 0.0;

  void _updateIndicator(int pageNumber) {
    setState(() {
      page = pageNumber.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: widget.pages.length,
              onPageChanged: (page) {
                _updateIndicator(page);
              },
              itemBuilder: (context, index) {
                return widget.pages[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: DotsIndicator(
              dotsCount: widget.pages.length,
              position: page,
              decorator: DotsDecorator(
                activeColor: Colors.red,
                spacing: const EdgeInsets.symmetric(horizontal: 12),
                size: const Size(10, 10),
                activeSize: const Size(14, 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}