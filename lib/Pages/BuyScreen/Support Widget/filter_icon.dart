import 'package:bullet24/Res/Theme/theme.dart';
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
    return GestureDetector(
      onTap: _temp,
      child: Align(
        alignment: Alignment.centerRight,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: active ? 260 : 60,
          width: active ? width : 60,
          decoration: ShapeDecoration(
            color: BS_FSG_button_false_color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows:  [
              BoxShadow(
                color: shadow_false,
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
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 250)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Icon(Icons.filter_list);
        } else {
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
      },
    );
  }
}
