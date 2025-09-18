import 'package:flutter/material.dart';
import 'package:news_app_route/ui/home/widget/chosse_theme_widget.dart';
import 'package:news_app_route/ui/home/widget/custom_dividar.dart';
import 'package:news_app_route/utils/app_color.dart';
import 'package:news_app_route/utils/app_style.dart';

typedef Ongotohomeclick = void Function();

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key, required this.ongotohomeclick});
  Ongotohomeclick ongotohomeclick;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: AppColor.blackColor,
      width: size.width * .6,
      shape: const LinearBorder(),
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: size.height * .2,
              color: AppColor.whiteColor,
              child: Text(
                "News App",
                style: AppStyle.black24bold,
              )),
          Padding(
            padding: EdgeInsets.all(size.width * .02),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.home_outlined,
                      color: AppColor.whiteColor,
                    ),
                    SizedBox(
                      width: size.width * .01,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Go to home
                          ongotohomeclick();
                        },
                        child: Text(
                          'GO To Home',
                          overflow: TextOverflow.visible,
                          style: AppStyle.white16bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                const CustomDividar(),
                SizedBox(
                  height: size.height * .01,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.brush,
                      color: AppColor.whiteColor,
                    ),
                    SizedBox(
                      width: size.width * .01,
                    ),
                    Text(
                      'Theme',
                      style: AppStyle.white16bold,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                const ChosseThemeWidget(),
                SizedBox(
                  height: size.height * .01,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
