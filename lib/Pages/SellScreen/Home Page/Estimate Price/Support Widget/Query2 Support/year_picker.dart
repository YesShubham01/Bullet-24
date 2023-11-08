import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/cupertino.dart';

// a custom year picker ~ from 1990 to 2023 ~default set to 2000

class YearPicker extends StatefulWidget {
  const YearPicker({super.key});

  @override
  State<YearPicker> createState() => _YearPickerState();
}

class _YearPickerState extends State<YearPicker> {
  int selectedYear = 2000;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 32.0,
      scrollController:
          FixedExtentScrollController(initialItem: selectedYear - 1990),
      onSelectedItemChanged: (int index) {
        setState(() {
          selectedYear = 1990 + index;
        });
      },
      children: List.generate(
          2023 - 1990 + 1, (index) => Text((1990 + index).toString())),
    );
  }
}

class YearPickerWithShadows extends StatelessWidget {
  const YearPickerWithShadows({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        height: 110,
        child: DecoratedBox(
          decoration: ShapeDecoration(
            color: BS_FSG_button_false_color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: shadow_false,
                blurRadius: 4,
                offset: const Offset(-2, 6),
                spreadRadius: 0,
              ),
            ],
          ),
          child: const YearPicker(),
        ),
      ),
    );
  }
}
