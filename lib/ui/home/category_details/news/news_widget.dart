import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route/di/di.dart';
import 'package:news_app_route/model/sourceresponse/source.dart';
import 'package:news_app_route/ui/home/category_details/news/cubit/news_statues.dart';
import 'package:news_app_route/ui/home/category_details/news/cubit/news_view_model.dart';
import 'package:news_app_route/ui/home/category_details/news/news_item.dart';
import 'package:news_app_route/utils/app_color.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({super.key, required this.source});
  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = NewsViewModel(newsRepositry: injectNewsRepositry());
  @override
  void initState() {
    viewModel.getNewsbysourceid(widget.source.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel, NewsStatues>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsErrorrStatues) {
          return Column(
            children: [
              Text(
                state.errorMessage,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsbysourceid(widget.source.id!);
                  },
                  child: const Text('try again'))
            ],
          );
        } else if (state is NewsSuccessStatues) {
          return ListView.builder(
            itemCount: state.news.length,
            itemBuilder: (context, index) {
              return NewsItem(news: state.news[index]);
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.grayColor,
            ),
          );
        }
      },
    );
  }
}

/*
FutureBuilder<Newsresponse?>(
        future: ApiManager.getnewsbysourceId(sourceId: source.id ?? ''),
        builder: (context, snapshot) {
          // waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.grayColor,
              ),
            );
          }
          // error from client
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return Column(
              children: [
                Text(
                  snapshot.error.toString(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('try again'))
              ],
            );
          }
          // response error
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(
                  snapshot.data!.message!,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('try again'))
              ],
            );
          }
          var newslist = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemCount: newslist.length,
            itemBuilder: (context, index) {
              return NewsItem(news: newslist[index]);
            },
          );
        }) */