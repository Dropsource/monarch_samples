import 'package:flutter/material.dart';

import 'animated_tap.dart';

class ContentListScreen extends StatelessWidget {
  final List<Category> categories;
  final String title;

  const ContentListScreen({Key? key, required this.categories, required this.title})
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
              onClick: () => categories[index].onClick?.call(),
            )),
        itemCount: categories.length,
      ),
    );
  }
}

class Category {
  final String label;
  final VoidCallback? onClick;

  Category({required this.label, this.onClick});
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
  final VoidCallback? onClick;

  CategoryItem({
    Key? key,
    required this.label,
    this.onClick,
  }) : super(
            key: key,
            child: CategoryCard(label: label),
            onPressed: (_) => onClick?.call());
}

class CategoryCard extends StatelessWidget {
  final String label;

  const CategoryCard({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor,
            blurRadius: 6,
            offset: Offset(0, 5),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      clipBehavior: Clip.hardEdge,
      child: Text(label),
    );
  }
}
