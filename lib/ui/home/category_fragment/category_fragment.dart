import 'package:flutter/material.dart';
import 'package:news_app_route/model/category_model.dart';
import 'package:news_app_route/provider/theme_provider.dart';
import 'package:news_app_route/ui/home/category_fragment/category_item_widget.dart';
import 'package:news_app_route/utils/app_image.dart';
import 'package:provider/provider.dart';

typedef Oncategoryactionclick = void Function(CategoryModel);

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key, required this.oncategoryactionclick});

  Oncategoryactionclick oncategoryactionclick;
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
          id: 'general',
          categortimagewhite: Appimage.generalwhiteimage,
          categortimageblack: Appimage.generalblackimage,
          categoryname: 'General'),
      CategoryModel(
          id: 'business',
          categortimageblack: Appimage.bussinessblackimage,
          categortimagewhite: Appimage.bussinesswhiteimage,
          categoryname: 'Bussiness'),
      CategoryModel(
          id: 'sports',
          categortimageblack: Appimage.sportsblackimage,
          categortimagewhite: Appimage.sportswhiteimage,
          categoryname: 'Sports'),
      CategoryModel(
          id: 'technology',
          categortimageblack: Appimage.technolgyblackimage,
          categortimagewhite: Appimage.technolgywhiteimage,
          categoryname: 'Technology'),
      CategoryModel(
          id: 'entertainment',
          categortimageblack: Appimage.entartinmentsblackimage,
          categortimagewhite: Appimage.entartinmentwhiteimage,
          categoryname: "Entertainment"),
      CategoryModel(
          id: 'health',
          categortimageblack: Appimage.healthblackimage,
          categortimagewhite: Appimage.healthwhiteimage,
          categoryname: "Health"),
      CategoryModel(
          id: 'science',
          categortimageblack: Appimage.scienceblackimage,
          categortimagewhite: Appimage.sciencewhiteimage,
          categoryname: "Science"),
    ];
    Size size = MediaQuery.of(context).size;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning \n Here is Some News For You',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Expanded(
                child: ListView.separated(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Gategory details
                    oncategoryactionclick(categories[index]);
                  },
                  child: CategoryItemWidget(
                    isdark: themeProvider.currenttheme == ThemeMode.dark,
                    categoryModel: categories[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: size.height * .02,
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
