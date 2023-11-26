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
  int active = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
        child: SizedBox(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  return Container();
                }
                return Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          activateTileFromIndex(index);
                        },
                        child: ChooseModelTile(
                            isActive: (index == active), text: "Model $index"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          activateTileFromIndex(index + 1);
                        },
                        child: ChooseModelTile(
                            isActive: ((index + 1) == active),
                            text: "Model ${index + 1}"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                );
              }),
        ));
  }

  activateTileFromIndex(int index) {
    setState(() {
      active = index;
      switch (index) {
        case 0:
          context
              .read<QueryPageProvider>()
              .setBulletModel(BulletModel.bullet350);
          break;
        case 1:
          context
              .read<QueryPageProvider>()
              .setBulletModel(BulletModel.classic350);
          break;
        case 2:
          context
              .read<QueryPageProvider>()
              .setBulletModel(BulletModel.hunter350);
          break;
        case 3:
          context
              .read<QueryPageProvider>()
              .setBulletModel(BulletModel.scram411);
          break;
        case 4:
          context
              .read<QueryPageProvider>()
              .setBulletModel(BulletModel.meteor350);
          break;
        case 5:
          context
              .read<QueryPageProvider>()
              .setBulletModel(BulletModel.superMeteor650);
          break;
        case 6:
          context
              .read<QueryPageProvider>()
              .setBulletModel(BulletModel.himalayan);
          break;
        case 7:
          context
              .read<QueryPageProvider>()
              .setBulletModel(BulletModel.newHimalayan);
          break;
        case 8:
          context
              .read<QueryPageProvider>()
              .setBulletModel(BulletModel.interceptor);
          break;
        case 9:
          context
              .read<QueryPageProvider>()
              .setBulletModel(BulletModel.continentalGT);
          break;
        default:
          // Handle the default case (if needed)
          break;
      }
    });
  }
}
