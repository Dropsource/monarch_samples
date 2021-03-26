import 'package:flutter/material.dart';

import '../default_theme.dart';
import '../widgets.dart';

class ContentListScreen extends StatelessWidget {
  final List<Category> categories;
  final String title;

  const ContentListScreen({Key key, this.categories, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: categories.isEmpty
          ? NoContentWidget()
          : _buildContentList(categories),
    );
  }

  Widget _buildContentList(List<Category> categories) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CategoryItem(
              label: categories[index].label,
              key: Key('category-card-$index'),
              onClick: () => categories[index]?.onClick(),
            )),
        itemCount: categories.length,
      ),
    );
  }
}

class Category {
  final String label;
  final VoidCallback onClick;

  Category({this.label, this.onClick});
}

class NoContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No categories available'),
    );
  }
}

class CategoryItem extends AnimatedTap {
  final String label;
  final VoidCallback onClick;

  CategoryItem({
    Key key,
    this.label,
    this.onClick,
  }) : super(
            key: key,
            child: CategoryCard(label: label),
            onPressed: (_) => onClick());
}

class CategoryCard extends StatelessWidget {
  final String label;

  const CategoryCard({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shadowDecoration,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      child: Text(label),
      clipBehavior: Clip.hardEdge,
    );
  }
}
