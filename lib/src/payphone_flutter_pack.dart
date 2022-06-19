import 'package:flutter/material.dart';
import 'package:payphone/src/api/api.dart';
import 'package:webviewx/webviewx.dart';

class PayphoneWidget extends StatefulWidget {
  final double width;
  final double height;
  final String token;
  final Function success;
  final Function cancelled;
  final int amount;
  final int tax;
  final int amountWithTax;
  final int expireIn;
  final String clientTransactionId;
  final String currency;
  final String reference;

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
      required this.expireIn,
      required this.clientTransactionId,
      required this.currency,
      required this.reference})
      : super(key: key);

  @override
  State<PayphoneWidget> createState() => _PayphoneWidgetState();
}

class _PayphoneWidgetState extends State<PayphoneWidget> {
  late WebViewXController webviewController;
  String link = '';
  bool loading = true;
  @override
  void didChangeDependencies() {
    loadData();
    super.didChangeDependencies();
  }

  loadData() async {
    setState(() {
      loading = true;
    });
    var response = await generateLinkPayPhone(
        widget.amount,
        widget.tax,
        widget.amountWithTax,
        widget.clientTransactionId,
        widget.currency,
        widget.reference,
        widget.expireIn,
        widget.token);
    setState(() {
      link = response;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: loading == true
          ? Container(
              width: widget.width,
              height: widget.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
          : WebViewX(
              initialContent: link,
              initialSourceType: SourceType.url,
              onWebViewCreated: (controller) => webviewController = controller,
              height: widget.height,
              width: widget.width,
              navigationDelegate: (navigation) {
                if (navigation.content.source.characters.string ==
                    "https://pay.payphonetodoesposible.com/PayPhone/Cancelled") {
                  widget.cancelled();
                  print('cancelado');
                }
                if (navigation.content.source.characters.string
                        .split('Result?')[0]
                        .toString() ==
                    "https://pay.payphonetodoesposible.com/Direct/") {
                  widget.success();
                  print('pagado');
                }
                if (navigation.content.source.characters.string
                        .split('/')[4]
                        .toString() ==
                    "Expired") {
                  widget.cancelled();

                  print('Expirado');
                }
                return NavigationDecision.navigate;
              },
            ),
    );
  }
}
