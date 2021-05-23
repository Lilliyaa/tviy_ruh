import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest/services/authentification.dart';
import 'package:flutter_apptest/services/rest_api.dart';
import 'package:flutter_apptest/ui/design/round_btn.dart';
import 'package:stripe_payment/stripe_payment.dart';


class Payment extends StatefulWidget{

  Function update;

  Payment({this.update});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Token _paymentToken;
  PaymentMethod _paymentMethod;
  String _error;

  final String _paymentIntentClientSecret = null;

  PaymentIntentResult _paymentIntent;
  Source _source;

  ScrollController _controller = ScrollController();

  final CreditCard testCard = CreditCard(
    number: '4000002760003184',
    expMonth: 12,
    expYear: 21,
  );

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  initState() {
    super.initState();

    StripePayment.setOptions(StripeOptions(
        publishableKey: "pk_test_aSaULNS8cJU6Tvo20VAXy6rp",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  void setError(dynamic error) {

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          centerTitle: true,
          title: Text(
          'Придбати преміум',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          //backgroundColor: Color(0xfffebb57),
        ),
        body: ListView(
          controller: _controller,
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            Image.asset("assets/images/premium.png"),
            Container(
                child: Text(
                  "Щоб отримати доступ до додаткового функціоналу, придбайте Premium.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                )),
            SizedBox(
              height: 20,
            ),
            RoundedButton(
              text: "Придбати",
              press:  () {
                StripePayment.paymentRequestWithNativePay(
                  androidPayOptions: AndroidPayPaymentRequest(
                    totalPrice: "3.50",
                    currencyCode: "EUR",
                  ),
                  applePayOptions: ApplePayPaymentOptions(
                    countryCode: 'DE',
                    currencyCode: 'EUR',
                    items: [
                      ApplePayItem(
                        label: 'Test',
                        amount: '13',
                      )
                    ],
                  ),
                ).then((token) {
                  setState(() {
                    applyPremium();
                  });
                }).catchError(setError);
              },
            ),
          ],
        ),
    );
  }

  void applyPremium() {
    String email = Authentification().getCurrentEmail();
    APIManager.switchUserToPremium(email);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            actions: [   CupertinoDialogAction(
            isDefaultAction: true,
            child: Text("Добре"),
            onPressed: () {
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
              widget.update();
            },
          )],
            // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: Text(
              "Вітаємо!",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            content: Text(
              "Ви перейшли на Premium акаунт",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          );
        });
  }
}