import 'package:flutter/material.dart';
import 'package:news_app_route/provider/theme_provider.dart';
import 'package:news_app_route/utils/app_color.dart';
import 'package:news_app_route/utils/app_style.dart';
import 'package:provider/provider.dart';

class ChosseThemeWidget extends StatefulWidget {
  const ChosseThemeWidget({super.key});

  @override
  State<ChosseThemeWidget> createState() => _ChosseThemeWidgetState();
}

class _ChosseThemeWidgetState extends State<ChosseThemeWidget> {
  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: size.height * .02, horizontal: size.width * .02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColor.whiteColor)),
      child: GestureDetector(
        onTap: chosseMode,
        child: Row(
          children: [
            Text(
              themeProvider.currenttheme == ThemeMode.dark ? 'dark' : 'light',
              style: AppStyle.white16bold,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_downward_outlined,
              color: AppColor.whiteColor,
            )
          ],
        ),
      ),
    );
  }

  void chosseMode() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  themeProvider.changetheme(ThemeMode.dark);
                },
                child: themeProvider.currenttheme == ThemeMode.dark
                    ? Row(
                        children: [
                          Text(
                            'Dark',
                            style: AppStyle.black16bold,
                          ),
                          const Spacer(),
                          const Icon(Icons.check)
                        ],
                      )
                    : Text(
                        'Dark',
                        style: AppStyle.black16bold,
                      ),
              ),
              GestureDetector(
                onTap: () {
                  themeProvider.changetheme(ThemeMode.light);
                },
                child: themeProvider.currenttheme == ThemeMode.light
                    ? Row(
                        children: [
                          Text(
                            'Light',
                            style: AppStyle.black16bold,
                          ),
                          const Spacer(),
                          const Icon(Icons.check)
                        ],
                      )
                    : Text(
                        'Light',
                        style: AppStyle.black16bold,
                      ),
              )
            ],
          ),
        );
      },
    );
  }
}
