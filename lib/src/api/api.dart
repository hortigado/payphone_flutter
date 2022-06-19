import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

generateLinkPayPhone(amount, tax, amountWithTax, clientTransactionId, currency,
    reference, expireIn, token) async {
  var response = await http.post(
      Uri.parse('https://pay.payphonetodoesposible.com/api/Links'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode({
        "amount": amount,
        "tax": tax,
        "amountWithTax": amountWithTax,
        "clientTransactionId": clientTransactionId,
        "currency": currency,
        "reference": reference,
        "expireIn": expireIn
      }));
  var decode = json.decode(response.body);
  print(response.body);

  return decode;
}
