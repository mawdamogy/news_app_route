import 'package:flutter/material.dart';
import 'package:news_app_route/model/sourceresponse/source.dart';
import 'package:news_app_route/ui/home/category_details/cubit/sources_view_model.dart';
import 'package:news_app_route/ui/home/category_details/news/news_widget.dart';
import 'package:news_app_route/ui/home/category_details/sources/sources_item.dart';
import 'package:news_app_route/utils/app_color.dart';

class SourcesTaps extends StatefulWidget {
  SourcesTaps({super.key, required this.sources});
  List<Source> sources;

  @override
  State<SourcesTaps> createState() => _SourcesTapsState();
}

class _SourcesTapsState extends State<SourcesTaps> {
  SourcesViewModel viewModel = SourcesViewModel();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
              onTap: (index) {
                viewModel.changeSelectedIndex(index);
              },
              isScrollable: true,
              indicatorColor: Theme.of(context).focusColor,
              tabAlignment: TabAlignment.start,
              dividerColor: AppColor.transparentColor,
              tabs: widget.sources.map(
                (e) {
                  return SourcesItem(
                    sourceName: e.name ?? '',
                    isselected:
                        viewModel.selectedindex == widget.sources.indexOf(e),
                  );
                },
              ).toList()),
          SizedBox(height: size.height * .03),
          Expanded(
              child:
                  NewsWidget(source: widget.sources[viewModel.selectedindex]))
        ],
      ),
    );
  }
}
