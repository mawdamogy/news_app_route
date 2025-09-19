import 'package:flutter/material.dart';
import 'package:news_app_route/model/sourceresponse/source.dart';
import 'package:news_app_route/ui/home/category_details/news/news_item.dart';
import 'package:news_app_route/ui/home/category_details/news/news_view_model.dart';
import 'package:news_app_route/utils/app_color.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({super.key, required this.source});
  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = NewsViewModel();
  @override
  void initState() {
    viewModel.getnews(widget.source.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, value, child) {
          if (viewModel.errormessage != null) {
            return Column(
              children: [
                Text(
                  viewModel.errormessage!,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('try again'))
              ],
            );
          } else if (viewModel.news == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.grayColor,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: viewModel.news?.length,
              itemBuilder: (context, index) {
                return NewsItem(news: viewModel.news![index]);
              },
            );
          }
        },
      ),
    );
  }
}

