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
    return InkWell(
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
                  ? const Color(0xFFA5C4F4)
                  : const Color(0xFFD4DFEF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              shadows: [
                BoxShadow(
                  color: const Color(0xFF4D72AD),
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
                    ? const Color(0xFF0A2E68)
                    : const Color(0x99092D68),
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
                      ? const Color(0xFF4D72AD)
                      : const Color(0x994D72AD),
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
    );
  }
}
