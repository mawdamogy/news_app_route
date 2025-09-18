import 'package:flutter/material.dart';
import 'package:news_app_route/model/category_model.dart';
import 'package:news_app_route/ui/home/category_details/category_details.dart';
import 'package:news_app_route/ui/home/category_fragment/category_fragment.dart';
import 'package:news_app_route/ui/home/widget/home_drawer.dart';
import 'package:news_app_route/utils/app_route.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedcategory == null ? 'home' : selectedcategory!.categoryname,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      drawer: HomeDrawer(
        ongotohomeclick: ongotohomeclick,
      ),
      body: selectedcategory == null
          ? CategoryFragment(
              oncategoryactionclick: oncategoryactionclick,
            )
          : CategoryDetails(
              categoryModel: selectedcategory!,
            ),
    );
  }

  CategoryModel? selectedcategory;

  oncategoryactionclick(CategoryModel newcategory) {
    selectedcategory = newcategory;
    setState(() {});
  }

  ongotohomeclick() {
    Navigator.pop(context);
    selectedcategory == null;
    Navigator.pushNamed(context, AppRoute.homeRoute);
  }
}
