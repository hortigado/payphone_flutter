import 'package:flutter/material.dart';
import 'package:payphone/payphone.dart';

class Payphone extends StatelessWidget {
  const Payphone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var amountWithTax = 100;
    var tax = 12;
    var amount = tax + amountWithTax;
    var clientTransactionId = "1234Ejemplo";
    var currency = "USD";
    String reference = "Pago1";
    String token =
        "AVVnsdChnMj8u34j9NLo9xw8LMI8vSfL5wbR7jNKKx-VX9JAju60Q8i2F7rm4svSE_1gAaPq7IDW_DM6tWeFa7kNgwT4_VOnBqhJk1u0HnCvRQfDIaPk-y9Eo-qPZYMxMu0Hh4AhwDiQlDqMp2mrevX38Lkx53fmh8g8Kx1UWd7mo2yb0SRoLtbqxXrkvCzkjxW15ijWz3ce2-D7n2G1QSdoKDNNrZLC0tpa9GeEEAxJ9d-tbTgQ3VLloUPXDysKcUO1vCo4Vu0iNaeNQ91EMk6MDiOBJ1VkhPGqXWV2yw7s5hu0uORmt8fzboOwIEk0JQayHVWWLgVeMiQTjyqfAcIhXbI";
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: PayphoneWidget(
          width: width,
          height: height,
          token: token,
          success: () {},
          cancelled: () {},
          amount: amount,
          tax: tax,
          amountWithTax: amountWithTax,
          clientTransactionId: clientTransactionId,
          currency: currency,
          reference: reference),
    );
  }
}
