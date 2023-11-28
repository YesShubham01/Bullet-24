import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// a custom year picker ~ from 1990 to 2023 ~default set to 2000

class YearPicker extends StatefulWidget {
  final bool isPurchase;
  const YearPicker({Key? key, required this.isPurchase}) : super(key: key);

  @override
  State<YearPicker> createState() => _YearPickerState();
}

class _YearPickerState extends State<YearPicker> {
  int selectedYear = 2000;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 50.0, // Increased item height for better touch interaction
      scrollController: FixedExtentScrollController(
        initialItem: getInitialItem(),
      ),
      onSelectedItemChanged: (int index) {
        setState(() {
          selectedYear = 1990 + index;
          if (widget.isPurchase) {
            context.read<QueryPageProvider>().setYearOfPurchase(selectedYear);
          } else {
            context.read<QueryPageProvider>().setYearOfRelease(selectedYear);
          }
        });
        context.read<QueryPageProvider>().setAllowNext(true);
      },
      children: List.generate(
        2023 - 1990 + 1,
        (index) => Center(
          child: Text(
            (1990 + index).toString(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }

  int getInitialItem() {
    return widget.isPurchase
        ? context.read<QueryPageProvider>().myVehical!.yearOfPurchase! - 1990
        : context.read<QueryPageProvider>().myVehical!.yearOfRelese! - 1990;
  }
}

class YearPickerWithShadows extends StatelessWidget {
  final bool ofPurchase;
  const YearPickerWithShadows({super.key, required this.ofPurchase});

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
          child: YearPicker(isPurchase: ofPurchase),
        ),
      ),
    );
  }
}
