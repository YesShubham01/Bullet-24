import 'package:flutter/cupertino.dart';

import '../Support Widget/Query2 Support/year_picker.dart';

class QueryScreen2 extends StatefulWidget {
  const QueryScreen2({super.key});

  @override
  State<QueryScreen2> createState() => _QueryScreen2State();
}

class _QueryScreen2State extends State<QueryScreen2> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Text("Enter Year of Model Released"),
        YearPickerWithShadows(),
        Text("Enter Year of Purchase"),
        YearPickerWithShadows(),
      ],
    );
  }
}
