import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';

class OptionSell extends StatefulWidget {
  final bool active;
  final VoidCallback onTap;
  const OptionSell({super.key, required this.active, required this.onTap});

  @override
  State<OptionSell> createState() => _OptionSellState();
}

class _OptionSellState extends State<OptionSell> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: InkWell(
        onTap: widget.onTap,
        child: Stack(
          children: [
            // this is background of the card.
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: widget.active ? 329 : 310,
              height: widget.active ? 140 : 120,
              decoration: ShapeDecoration(
                color: widget.active
                    ? BS_button_active_color
                    : BS_FSG_button_false_color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: [
                  BoxShadow(
                    color: BS_subtitle_shadow_true_color,
                    blurRadius: 4,
                    offset: const Offset(-2, 6),
                    spreadRadius: widget.active ? 5 : 1,
                  )
                ],
              ),
            ),

            // Title --> Buy
            Positioned(
              left: 30,
              top: 18,
              child: Text(
                'Sell',
                style: TextStyle(
                  color: widget.active
                      ? BS_Cshadow_active_color
                      : BS_false_color,
                  fontSize: 40,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),

            // Subtitle --> Choose from Certified Vehicals.
            Positioned(
              left: 30,
              top: 69,
              child: SizedBox(
                width: 135,
                height: 43,
                child: Text(
                  'Get Best Price Online Instantly.',
                  style: TextStyle(
                    color: widget.active
                        ? BS_subtitle_shadow_true_color
                        : BS_subtitle_false_color,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),

            // Sample image
            Positioned(
              right: 0,
              top: 0,
              child: Image.asset(
                "images/SampleBike/sample2.png",
                width: 163,
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
