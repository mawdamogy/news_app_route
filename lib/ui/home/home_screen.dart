import 'package:flutter/material.dart';
import 'package:news_app_route/ui/home/category_details/category_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'home',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: CategoryDetails(),
    );
  }
}
