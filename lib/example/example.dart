import 'package:flutter/material.dart';
import 'package:payphone/src/payphone_flutter_pack.dart';

class ExamplePage extends StatefulWidget {
  ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // child: PayphoneWidget(
        //     width: width,
        //     height: height,
        //     token: token,
        //     success: success,
        //     cancelled: cancelled,
        //     amount: amount,
        //     tax: tax,
        //     amountWithTax: amountWithTax,
        //     expireIn: expireIn,
        //     clientTransactionId: clientTransactionId,
        //     currency: currency,
        //     reference: reference),
        );
  }
}
