import 'package:bullet24/Pages/BuyScreen/buy_screen.dart';
import 'package:bullet24/Pages/Select%20Page/Support%20Widget/animated_continue_button.dart';
import 'package:bullet24/Pages/Select%20Page/Support%20Widget/title_text_1.dart';
import 'package:bullet24/Pages/SellScreen/sell_screen.dart';
import 'package:bullet24/Provider/my_provider.dart';
import 'package:bullet24/Services/FireStore%20Services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Support Widget/option_1_buy.dart';
import 'Support Widget/option_2_sell.dart';
import 'Support Widget/topleft_logo.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  bool _buyStatus = false;
  bool _sellStatus = false;
  bool _buttonActive = false;

  void _onOptionTap(bool buy) {
    setState(() {
      _buyStatus = buy;
      _sellStatus = !buy;
      _buttonActive = true;
    });
  }

  void _onContinueButtonTap() {
    print("Button pressed");
    if (_buyStatus) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BuyScreen()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const SellScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    String? username = FirebaseAuth.instance.currentUser?.displayName;
    context.read<MyProvider>().setUserName(username);
    context.read<MyProvider>().setNotification(context);

    FireStore.checkUserDocument(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const TopLeftLogo(),
            const TitleBlueTint(text: "What would you like to do?\n"),
            OptionBuy(active: _buyStatus, onTap: () => _onOptionTap(true)),
            OptionSell(active: _sellStatus, onTap: () => _onOptionTap(false)),
            AnimatedContinueButton(
                active: _buttonActive, onTap: _onContinueButtonTap),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
