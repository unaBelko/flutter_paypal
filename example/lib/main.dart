import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Paypal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Paypal Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => UsePaypal(
                  sandboxMode: true,
                  clientId:
                      "AW1TdvpSGbIM5iP4HJNI5TyTmwpY9Gv9dYw8_8yW5lYIbCqf326vrkrp0ce9TAqjEGMHiV3OqJM_aRT0",
                  secretKey:
                      "EHHtTDjnmTZATYBPiGzZC_AZUfMpMAzj2VZUeqlFUrRJA_C0pQNCxDccB5qoRQSEdcOnnKQhycuOWdP9",
                  returnURL: "https://samplesite.com/return",
                  cancelURL: "https://samplesite.com/cancel",
                  transactions: const [
                    {
                      "amount": {
                        "total": '10.12',
                        "currency": "USD",
                        "details": {
                          "subtotal": '10.12',
                          "shipping": '0',
                          "shipping_discount": 0
                        }
                      },
                      "description": "The payment transaction description.",
                      "item_list": {
                        "items": [
                          {
                            "name": "A demo product",
                            "quantity": 1,
                            "price": '10.12',
                            "currency": "USD"
                          }
                        ],
                        "shipping_address": {
                          "recipient_name": "Jane Foster",
                          "line1": "Travis County",
                          "line2": "",
                          "city": "Austin",
                          "country_code": "US",
                          "postal_code": "73301",
                          "phone": "+00000000",
                          "state": "Texas"
                        },
                      }
                    }
                  ],
                  note: "Contact us for any questions on your order.",

                  // ✅ Proper callback types
                  onSuccess: (Map<String, dynamic> params) async {
                    print("✅ Payment successful!");
                    print(params);
                  },
                  onError: (dynamic error) async {
                    print("❌ Payment error:");
                    print(error);
                  },
                  onCancel: () {
                    print("⚠️ Payment was cancelled by the user.");
                  },
                ),
              ),
            );
          },
          child: const Text("Make Payment"),
        ),
      ),
    );
  }
}
