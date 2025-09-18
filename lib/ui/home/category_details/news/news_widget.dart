import 'package:flutter/material.dart';
import 'package:news_app_route/api/api_manager.dart';
import 'package:news_app_route/model/newsresponse/newsresponse.dart';
import 'package:news_app_route/model/sourceresponse/source.dart';
import 'package:news_app_route/ui/home/category_details/news/news_item.dart';
import 'package:news_app_route/utils/app_color.dart';

class NewsWidget extends StatelessWidget {
   NewsWidget({super.key,required this.source});
  Source source;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Newsresponse?>(
        future: ApiManager.getnewsbysourceId(
            sourceId: source.id ?? ''),
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
                ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text('try again'))
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
                ElevatedButton(
                    onPressed: () {
                     
                    },
                    child: const Text('try again'))
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
        });
  }
}
