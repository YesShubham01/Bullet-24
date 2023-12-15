import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class TestingPayment2 extends StatefulWidget {
  const TestingPayment2({super.key});

  @override
  State<TestingPayment2> createState() => _TestingPayment2State();
}

class _TestingPayment2State extends State<TestingPayment2> {
  Map<String, dynamic>? paymentIntent;

  createPaymentIntent() async {
    try {
      Map<String, dynamic> body = {
        "currency": "USD",
        "amount": "1000",
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: makePayment,
          child: const Text("Make Payment of \$10"),
        ),
      ),
    );
  }
}
