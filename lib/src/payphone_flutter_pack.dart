import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:payphone/src/api/api.dart';
/* import 'package:webview_flutter/webview_flutter.dart'; */
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayphoneWidget extends StatefulWidget {
  // VARIABLES NECESARIAS
  final double width;
  final double height;
  final String token;
  final Function success;
  final Function cancelled;
  final int amount;
  final int tax;
  final int amountWithTax;
  final String clientTransactionId;
  final String currency;
  final String reference;

  // CONSTRUCTOR

  PayphoneWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.token,
      required this.success,
      required this.cancelled,
      required this.amount,
      required this.tax,
      required this.amountWithTax,
      required this.clientTransactionId,
      required this.currency,
      required this.reference})
      : super(key: key);

  @override
  State<PayphoneWidget> createState() => _PayphoneWidgetState();
}

class _PayphoneWidgetState extends State<PayphoneWidget> {
  late WebViewController webviewController;

  String link = '';
  bool loading = true;
  String? error;
  @override
  void didChangeDependencies() {
    loadData();
    super.didChangeDependencies();
  }

  loadData() async {
    // Generamos el loading de carga y generamos el link que utilizaremos

    setState(() {
      loading = true;
    });
    // Enviamos los datos

    try {
      var response = await generateLinkPayPhone(
          widget.amount,
          widget.tax,
          widget.amountWithTax,
          widget.clientTransactionId,
          widget.currency,
          widget.reference,
          widget.token);
      if (response.toString().contains("Code")) {
        Map<String, dynamic> data = response;
        print("aa ${data["Message"]}");
        setState(() {
          loading = false;
          error = data["Message"];
        });
      } else {
        setState(() {
          link = response;
          loading = false;
        });
      }
    } catch (e) {
      setState(() {
        loading = false;
        error = e.toString();
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    /*  print(Uri.parse(link).toString()); */

    if (loading == false) {
      launchUrlString(
        "https://hordevfree.online/payphone.html",
        mode: LaunchMode.externalNonBrowserApplication,
      );

      /*   try {
        FlutterWebAuth2.authenticate(
          url: "https://hordevfree.online/payphone.html",
          callbackUrlScheme: "https://payphone-callback.hordevfree.online",
        ).then((value) async {
          print("aaaaa $value");
          Uri url = Uri.parse(value);
          final key = url.queryParameters['key'];
        });
      } catch (e) {
        print(e);
      } */

      /*     webviewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(Color.fromARGB(0, 252, 251, 251))
        ..setNavigationDelegate(NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          /*  onUrlChange: (change) {
            if (change.url!.startsWith('intent://')) {
              var newUrl = change.url.toString().replaceAll("intent", "https");

              webViewController.loadRequest(Uri.parse(newUrl));
            }
          }, */
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async {
            if (request.url.startsWith('intent://')) {
              // Manejar la URL de intención personalizada aquí
              var newUrl = request.url.toString().replaceAll("intent", "");

              launchUrl(Uri.https(newUrl));
              print(5555);

              return NavigationDecision.prevent;
            }

            if (request.url ==
                "https://pay.payphonetodoesposible.com/PayPhone/Cancelled") {
              widget.cancelled();
              print('cancelado');
            }
            if (request.url.split('Result?')[0].toString() ==
                "https://pay.payphonetodoesposible.com/Direct/") {
              widget.success();
              print('pagado');
            }
            if (request.url.split('/')[4].toString() == "Expired") {
              widget.cancelled();

              print('Expirado');
            }
            return NavigationDecision.navigate;
          },
        ))
        ..loadRequest(Uri.parse("https://hordevfree.online/payphone.html")); */
    }

    return Scaffold(
        body: loading == true
            ? Container(
                width: widget.width,
                height: widget.height,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Image.asset("assets/images/payphone.png",
                            package: "payphone", width: widget.width * .2),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          color: Colors.greenAccent,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : error != null
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Image.asset("assets/images/payphone.png",
                            package: "payphone", width: widget.width * .2),
                      ),
                      Text(
                        error!,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ))
                : Container());
  }
}
