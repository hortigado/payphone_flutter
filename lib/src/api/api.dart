import 'package:http/http.dart' as http;
import 'dart:convert';

//SE GENERA UN LINK DE PAGO CON LA INFORMACIÓN UTILIZANDO LA API DE PAYPHONE Y DEVOLVEMOS LA URL RESULTANTE
generateLinkPayPhone(amount, tax, amountWithTax, clientTransactionId, currency,
    reference, token) async {
  var response = await http.post(
      Uri.parse('https://pay.payphonetodoesposible.com/api/Links'),
      /*  Uri.parse('https://hordevfree.online/payphone'), */
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode({
        "amount": amount,
        "tax": tax,
        "amountWithTax": amountWithTax,
        "responseUrl": "https://hordevfree.online/payphone-callback/pagado",
        "cancellationUrl":
            "https://hordevfree.online/payphone-callback/cancelado",
        "clientTransactionId": clientTransactionId,
        "currency": currency,
        "reference": reference,
        "expireIn": 1
      }));
  var decode = json.decode(response.body);
  print(decode);
  return decode;
}
