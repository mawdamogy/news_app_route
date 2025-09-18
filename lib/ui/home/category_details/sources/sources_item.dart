import 'package:flutter/material.dart';

class SourcesItem extends StatelessWidget {
  SourcesItem({super.key, required this.sourceName, required this.isselected});
  String sourceName;
  bool isselected;
  @override
  Widget build(BuildContext context) {
    return Text(
      sourceName,
      style: isselected
          ? Theme.of(context).textTheme.labelMedium
          : Theme.of(context).textTheme.labelSmall,
    );
  }
}
