import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class PaymentPage extends StatefulWidget {
  final int amount;
  const PaymentPage({super.key, required this.amount});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Map<String, dynamic>? paymentIntent;

  createPaymentIntent() async {
    try {
      String amount = (widget.amount * 100).toString();
      Map<String, dynamic> body = {
        "currency": "INR",
        "amount": amount,
        "payment_method_types[]": "card",
      };

      http.Response response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        body: body,
        headers: {
          "Authorization":
              "Bearer sk_test_51NxrFZSByBFnaKsKhj9ar6x4CttrLk358rm5ijVUTyYRSidsxC2uixWufrJrQP1d0mYywQIUT2jBTUmevRLVlIVv00udh6TjH0",
          "Content-Type": "application/x-www-form-urlencoded",
        },
      );

      if (response.statusCode == 200) {
        print("Payment created successfully");
        return jsonDecode(response.body.toString());
      } else {
        print("Failed to create payment: ${response.statusCode}");
        throw Exception("Failed to create payment");
      }
    } catch (e) {
      print("Mew Failed: $e");
      throw Exception(e.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      print("sheet display done");
      setState(() {});
    } catch (e) {
      print("mew2 error:$e");
    }
  }

  makePayment() async {
    try {
      print("on click working");
      paymentIntent = await createPaymentIntent();
      var gpay = const PaymentSheetGooglePay(merchantCountryCode: "US");

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          style: ThemeMode.light,
          paymentIntentClientSecret: paymentIntent?["client_secret"],
          merchantDisplayName: "Shubham",
          googlePay: const PaymentSheetGooglePay(
              merchantCountryCode: "IND", currencyCode: "INR"),
        ),
      );

      displayPaymentSheet();

      print("done");
    } catch (e) {
      print("mew3 error:$e");
    }

    //! remove this later
    // await Future.delayed(const Duration(seconds: 5));
    // Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => const OrderWaiting()));
  }

  @override
  void initState() {
    super.initState();
    makePayment();
  }

  @override
  Widget build(BuildContext context) {
    bool status = (paymentIntent == null);
    if (status == false) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          const snackBar = SnackBar(
            content: Text('Payment successful! Track in your Profile Page.'),
            duration: Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
      );
    }
    return Scaffold(
      appBar: AppBar(),
      body: status
          ? Center(
              child: Lottie.asset('images/Lottie/waiting_sand_animation.json'),
            )
          : Center(child: Lottie.asset('images/Lottie/done_animation.json')),
    );
  }
}
