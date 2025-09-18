import 'package:flutter/material.dart';
import 'package:news_app_route/model/sourceresponse/source.dart';
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
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        DefaultTabController(
            initialIndex: selectedindex,
            length: widget.sources.length,
            child: TabBar(
                onTap: (index) {
                  setState(() {
                    selectedindex = index;
                  });
                },
                isScrollable: true,
                indicatorColor: Theme.of(context).focusColor,
                tabAlignment: TabAlignment.start,
                dividerColor: AppColor.transparentColor,
                tabs: widget.sources.map(
                  (e) {
                    return SourcesItem(
                      sourceName: e.name ?? '',
                      isselected: selectedindex == widget.sources.indexOf(e),
                    );
                  },
                ).toList())),
        SizedBox(height: size.height * .04),
        Expanded(child: NewsWidget(source: widget.sources[selectedindex]))
      ],
    );
  }
}
