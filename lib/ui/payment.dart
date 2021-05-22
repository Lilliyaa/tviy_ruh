import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

class Payment extends StatefulWidget{

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Center(
        child:
      ElevatedButton(
        onPressed: (){
          handleTap(context);
        },
          child:Text("Pay"),
        )
      ),
    );
  }


  Future<void> handleTap(BuildContext context) async {
    var request = BraintreeDropInRequest(
      tokenizationKey: 'sandbox_8hr42jn7_26d43gjpxn5k7vwp	',
      collectDeviceData: true,
      paypalRequest: BraintreePayPalRequest(
        amount: '1.0',
        displayName: 'Liliia'
      ),
      cardEnabled: true
    );
    BraintreeDropInResult result = await BraintreeDropIn.start(request);
    if (result != null){
      print(result.paymentMethodNonce.description);
      print(result.paymentMethodNonce.nonce);
    }

   /* showDialog(context: context, builder: (BuildContext context) =>
    AlertDialog(
      title: Text("Kool"),
      content: Text("really kool"),
    ));*/
  }

}