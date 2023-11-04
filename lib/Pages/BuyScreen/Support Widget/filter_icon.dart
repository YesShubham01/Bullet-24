import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  bool active = false;

  _temp() {
    setState(() {
      active = !active;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 25;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: _temp,
      child: Align(
        alignment: Alignment.centerRight,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: active ? 260 : 60,
          width: active ? width : 60,
          decoration: ShapeDecoration(
            color: const Color(0xFFEDEEF0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0xFF496A9F),
                blurRadius: 4,
                offset: Offset(-2, 6),
                spreadRadius: 0,
              )
            ],
          ),
          child: active ? const FilterOptions() : const Icon(Icons.filter_list),
        ),
      ),
    );
  }
}

class FilterOptions extends StatelessWidget {
  const FilterOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text("Option"),
          Text("Option"),
          Text("Option"),
          Text("Option"),
        ],
      ),
    );
  }
}
