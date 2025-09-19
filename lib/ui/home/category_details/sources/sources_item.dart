import 'package:flutter/material.dart';

class SourcesItem extends StatelessWidget {
  SourcesItem({super.key, required this.sourceName,
  // required this.isselected,
  required this.tabIndex});
  String sourceName;
  ///bool isselected;
  int tabIndex;
  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);
    final bool isSelected = controller.index == tabIndex;
    return Text(
      sourceName,
      style: isSelected
          ? Theme.of(context).textTheme.labelMedium
          : Theme.of(context).textTheme.labelSmall,
    );
  }
}
