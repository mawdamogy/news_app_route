import 'package:flutter/material.dart';
import 'package:news_app_route/api/api_manager.dart';
import 'package:news_app_route/model/sourceresponse/sourceresponse.dart';
import 'package:news_app_route/ui/home/category_details/sources/sources_taps.dart';
import 'package:news_app_route/utils/app_color.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Sourceresponse?>(
      future: ApiManager.getsources(),
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
          return Column(
            children: [
              Text(
                'something went wrong',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ApiManager.getsources();
                    });
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
                    setState(() {
                      ApiManager.getsources();
                    });
                  },
                  child: const Text('try again'))
            ],
          );
        }
        var sourceslist = snapshot.data?.sources ?? [];
        return SourcesTaps(
          sources: sourceslist,
        );
      },
    );
  }
}
