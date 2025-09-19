import 'package:flutter/material.dart';
import 'package:news_app_route/model/category_model.dart';
import 'package:news_app_route/ui/home/category_details/sources/sources_taps.dart';
import 'package:news_app_route/ui/home/category_details/sources_view_model.dart';
import 'package:news_app_route/utils/app_color.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.categoryModel});
  CategoryModel categoryModel;
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourcesViewModel viewModel = SourcesViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getsources(widget.categoryModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<SourcesViewModel>(
          builder: (context, viewmodel, child) {
            if (viewmodel.errormessage != null) {
              return Column(
                children: [
                  Text(
                    viewmodel.errormessage!,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          viewmodel.getsources(widget.categoryModel.id);
                        });
                      },
                      child: const Text('try again'))
                ],
              );
            } else if (viewmodel.sources == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.grayColor,
                ),
              );
            } else {
              return SourcesTaps(
                sources: viewmodel.sources!,
              );
            }
          },
        ));
  }
}
