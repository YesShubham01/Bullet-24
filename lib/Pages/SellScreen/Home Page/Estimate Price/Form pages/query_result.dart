import 'package:flutter/material.dart';

class EstimateQueryResult extends StatefulWidget {
  const EstimateQueryResult({super.key});

  @override
  State<EstimateQueryResult> createState() => _EstimateQueryResultState();
}

class _EstimateQueryResultState extends State<EstimateQueryResult> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
