import 'package:bullet24/Pages/BuyScreen/buy_screen.dart';
import 'package:bullet24/Pages/Select%20Page/Support%20Widget/animated_continue_button.dart';
import 'package:bullet24/Pages/Select%20Page/Support%20Widget/title_text_1.dart';
import 'package:bullet24/Pages/SellScreen/sell_screen.dart';
import 'package:flutter/material.dart';

import 'Support Widget/option_1_buy.dart';
import 'Support Widget/option_2_sell.dart';
import 'Support Widget/topleft_logo.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  bool _button_active = false;
  bool _buy_status = false;
  bool _sell_status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // background Gradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFFCDE0FF), Color(0xFFE2E7EF)],
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //logo
              const TopLeftLogo(),

              //title
              const TitleBlueTint(text: "What would you like to do?\n"),

              //option 1 buy
              OptionBuy(
                active: _buy_status,
                onTap: option_buy_onTap,
              ),

              //option 2 sell
              OptionSell(
                active: _sell_status,
                onTap: option_sell_onTap,
              ),

              // continue Button

              AnimatedContinueButton(
                  active: _button_active, onTap: continue_button_ontap),

              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void continue_button_ontap() {
    print("Button pressed");
    if (_buy_status) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BuyScreen()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const SellScreen()));
    }
  }

  void option_buy_onTap() {
    setState(() {
      _buy_status = true;
      _sell_status = false;
    });

    activateButton();
  }

  void option_sell_onTap() {
    setState(() {
      _buy_status = false;
      _sell_status = true;
    });

    activateButton();
  }

  void activateButton() {
    if (_button_active == false) {
      setState(() {
        _button_active = true;
      });
    }
  }
}
