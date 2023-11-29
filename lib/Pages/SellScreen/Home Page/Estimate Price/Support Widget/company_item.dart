import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:provider/provider.dart';

class CompanyItemTile extends StatelessWidget {
  final int isActive;
  final String text;
  final Widget? child;
  const CompanyItemTile(
      {super.key, required this.isActive, required this.text, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Align children to the start (left)
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: getHeight(),
            width: getWidth(),
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
                )
              ],
            ),
            child: child,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 5),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  getHeight() {
    if (isActive == 0) {
      return 110.00;
    } else if (isActive == 1) {
      return 110.00;
    } else {
      return 50.00;
    }
  }

  getWidth() {
    if (isActive == 0) {
      return 110.00;
    } else if (isActive == 1) {
      return 190.00;
    } else {
      return 50.00;
    }
  }
}

class TwoCompanyItems extends StatefulWidget {
  const TwoCompanyItems({super.key});

  @override
  State<TwoCompanyItems> createState() => _TwoCompanyItemsState();
}

class _TwoCompanyItemsState extends State<TwoCompanyItems> {
  int tile1 = 0;
  int tile2 = 0;

  int tile1Flex = 1;
  int tile2Flex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: tile1Flex,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                select_1();
              },
              child: CompanyItemTile(
                isActive: tile1,
                text: "Royal Enfield",
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child:
                      Image(image: AssetImage("images/royal_enfeild_logo.png")),
                ),
              ),
            ),
          ),
          Expanded(
            flex: tile2Flex,
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                select_2();
              },
              child: CompanyItemTile(
                isActive: tile2,
                text: "Others",
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Image(image: AssetImage("images/OtherCompany.png")),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  select_1() {
    setState(() {
      context
          .read<QueryPageProvider>()
          .setCompanyOfVehical(Company.royalEnfield);

      tile1 = 1;
      tile2 = -1;
      tile1Flex = 1;
      tile2Flex = 0;
    });
  }

  select_2() {
    setState(() {
      context.read<QueryPageProvider>().setCompanyOfVehical(Company.other);

      tile2 = 1;
      tile1 = -1;
      tile1Flex = 0;
      tile2Flex = 1;
    });
  }
}
