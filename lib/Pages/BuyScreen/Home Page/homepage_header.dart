import 'package:flutter/material.dart';

import '../Support Widget/filter_icon.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: SearchBar(),
        )),
        FilterWidget(),
      ],
    );
  }
}
