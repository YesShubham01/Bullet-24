import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChooseModelTile extends StatelessWidget {
  final bool isActive;
  final String text;
  const ChooseModelTile(
      {super.key, required this.isActive, required this.text});

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
            height: isActive ? 130 : 100,
            width: isActive ? 160 : 120,
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
}

class GridModelTiles extends StatefulWidget {
  const GridModelTiles({super.key});

  @override
  State<GridModelTiles> createState() => _GridModelTilesState();
}

class _GridModelTilesState extends State<GridModelTiles> {
  bool tile1 = false;
  bool tile2 = false;
  bool tile3 = false;
  bool tile4 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Column(
        children: [
          const Divider(thickness: 3),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    activateTile1();
                  },
                  child: ChooseModelTile(isActive: tile1, text: "Model 1"),
                ),
              ),
              Expanded(
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    activateTile2();
                  },
                  child: ChooseModelTile(isActive: tile2, text: "Model 2"),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    activateTile3();
                  },
                  child: ChooseModelTile(isActive: tile3, text: "Model 3"),
                ),
              ),
              Expanded(
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    activateTile4();
                  },
                  child: ChooseModelTile(isActive: tile4, text: "Model 4"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  activateTile1() {
    setState(() {
      context.read<QueryPageProvider>().setBulletModel(BulletModel.model1);

      tile1 = true;
      tile2 = false;
      tile3 = false;
      tile4 = false;
    });
  }

  activateTile2() {
    setState(() {
      context.read<QueryPageProvider>().setBulletModel(BulletModel.model2);

      tile1 = false;
      tile2 = true;
      tile3 = false;
      tile4 = false;
    });
  }

  activateTile3() {
    setState(() {
      context.read<QueryPageProvider>().setBulletModel(BulletModel.model3);

      tile1 = false;
      tile2 = false;
      tile3 = true;
      tile4 = false;
    });
  }

  activateTile4() {
    setState(() {
      context.read<QueryPageProvider>().setBulletModel(BulletModel.model4);

      tile1 = false;
      tile2 = false;
      tile3 = false;
      tile4 = true;
    });
  }
}
