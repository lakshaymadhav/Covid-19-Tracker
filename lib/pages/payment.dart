import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';


class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  int totalamount=0;
  Razorpay _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay=Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout(){
    var options={
      'key':'rzp_test_gZtHIyFl71vYuz',
      'amount':totalamount*100,
      'name':'LAKSHAY MADHAV',
      'description':'Developer Donation',
      'prefill':{'contact':'','email':''},
      'external':{
        'wallets':['patym'],
      }
    };
    try{
      _razorpay.open(options);
    }
    catch(e)
    {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: 'SUCCESS '+response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: 'SUCCESS '+response.code.toString()+' - '+response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response){
      Fluttertoast.showToast(msg: 'EXTERNAL_WALLET '+response.walletName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             
             Container(
                  width: 200,
                  child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ENTER AMOUNT',
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onChanged: (value){
                    totalamount=num.parse(value);
                  },
                ),
             ),
             SizedBox(
               height: 15,
             ),
             RaisedButton(
               shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
               color: Colors.blue[300],
               child: Text('PAY',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ),),
               onPressed: (){
                 openCheckout();
               },
               ),

               SizedBox(
               height: 35,
             ),

                Text("Your kind Gesture is highly appreciated!!",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),
            
          ],
        ),
      ),
    );
  }
}