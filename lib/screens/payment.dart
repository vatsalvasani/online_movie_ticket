// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class payment extends StatefulWidget {
//   @override
//   State<payment> createState() => _paymentState();
// }
//
// class _paymentState extends State<payment> {
//   static const platform = const MethodChannel("razorpay_flutter");
//
//   late Razorpay _razorpay;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Razorpay Sample App'),
//         ),
//         body: Center(
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   ElevatedButton(onPressed: openCheckout, child: Text('Open'))
//                 ])),
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }
//
//   void openCheckout() async {
//     var options = {
//       'key': 'rzp_live_ILgsfZCZoFIKMb',
//       'amount': 100,
//       'name': 'Acme Corp.',
//       'description': 'Fine T-Shirt',
//       'retry': {'enabled': true, 'max_count': 1},
//       'send_sms_hash': true,
//       'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };
//
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error: e');
//     }
//   }
//
//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     print('Success Response: $response');
//     /*Fluttertoast.showToast(
//         msg: "SUCCESS: " + response.paymentId!,
//         toastLength: Toast.LENGTH_SHORT); */
//   }
//
//   void _handlePaymentError(PaymentFailureResponse response) {
//     print('Error Response: $response');
//     /* Fluttertoast.showToast(
//         msg: "ERROR: " + response.code.toString() + " - " + response.message!,
//         toastLength: Toast.LENGTH_SHORT); */
//   }
//
//   void _handleExternalWallet(ExternalWalletResponse response) {
//     print('External SDK Response: $response');
//     /* Fluttertoast.showToast(
//         msg: "EXTERNAL_WALLET: " + response.walletName!,
//         toastLength: Toast.LENGTH_SHORT); */
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pay/pay.dart';

void main() {
  runApp(PayMaterialApp());
}

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

class PayMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay for Flutter Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
        const Locale('de', ''),
      ],
      home: PaySampleApp(),
    );
  }
}

class PaySampleApp extends StatefulWidget {
  PaySampleApp({Key? key}) : super(key: key);

  @override
  _PaySampleAppState createState() => _PaySampleAppState();
}

class _PaySampleAppState extends State<PaySampleApp> {

  final paymentItems = <PaymentItem> [];

  @override
  void initState(){
    paymentItems.add(PaymentItem(amount:'600',label:"product1",status: PaymentItemStatus.final_price));
    super.initState();
  }

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  // void onApplePayResult(paymentResult) {
  //   debugPrint(paymentResult.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T-shirt Shop'),
      ),
      body: Center(
        child: GooglePayButton(
            paymentConfigurationAsset:'gpay.json',
            paymentItems: paymentItems,
            onPaymentResult: (data){
              print(data);
            },
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ));
          // ApplePayButton(
          //   paymentConfigurationAsset: 'default_payment_profile_apple_pay.json',
          //   paymentItems: _paymentItems,
          //   style: ApplePayButtonStyle.black,
          //   type: ApplePayButtonType.buy,
          //   margin: const EdgeInsets.only(top: 15.0),
          //   onPaymentResult: onApplePayResult,
          //   loadingIndicator: const Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // ),
  }
}