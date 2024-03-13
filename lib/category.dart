import 'package:flutter/material.dart';

import 'home.dart';
class CustomSearchDelegate extends SearchDelegate<String> {
  final List<Category> categories;

  CustomSearchDelegate(this.categories);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search results
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Category> suggestionList = query.isEmpty
        ? categories
        : categories.where((category) => category.name.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].name),
          onTap: () {
            // You can handle the suggestion selection here
          },
        );
      },
    );
  }
}

class Category {
  final String name;
  final Color color;

  Category(this.name, this.color);
}

List<Category> categoryData = [
  Category("All", Color(0xff900e0e)),
  Category("Pizza", Colors.white),
  Category("Burger", Colors.white),
  Category("Sandwich", Colors.white),
  Category("Fries", Colors.white),
];

void main() {
  runApp(MaterialApp(
    home: home(),
  ));
}