import 'package:flutter/material.dart';
import 'package:flutter_upi/flutter_upi.dart';

import 'dart:async';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {


 Future _initiateTransaction;
 GlobalKey<ScaffoldState> _key;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _key=GlobalKey<ScaffoldState>();
  }
 
  Future<String> initiateTransaction(String app) async{
    String response = await FlutterUpi.initiateTransaction(
      app: app, 
      pa: "lakshaymadhav25@okicici", 
      pn: "LAKSHAY MADHAV", 
      tr: "UniqueTransactionId", 
      tn: "Developer Donation", 
      am: "0", 
      cu: "INR", 
      url: "www.google.com",
      );
      print(response);
      return response;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder(
                  future: _initiateTransaction,
                  builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.data == null) {
                      return Text("Processing or Yet to start...");
                    } else {
                      switch (snapshot.data.toString()) {
                        case 'app_not_installed':
                          return Text("Application not installed.");
                          break;
                        case 'invalid_params':
                          return Text("Request parameters are wrong");
                          break;
                        case 'user_canceled':
                          return Text("User canceled the flow");
                          break;
                        case 'null_response':
                          return Text("No data received");
                          break;
                        default:
                          {
                            FlutterUpiResponse flutterUpiResponse =
                                FlutterUpiResponse(snapshot.data);
                            print(flutterUpiResponse.txnId);
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                        flex: 2, child: Text("Transaction ID")),
                                    Expanded(
                                        flex: 3,
                                        child: Text(flutterUpiResponse.txnId)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                        flex: 2,
                                        child: Text("Transaction Reference")),
                                    Expanded(
                                        flex: 3,
                                        child: Text(flutterUpiResponse.txnRef)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                        flex: 2,
                                        child: Text("Transaction Status")),
                                    Expanded(
                                        flex: 3,
                                        child: Text(flutterUpiResponse.Status)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Text("Approval Reference Number"),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                          flutterUpiResponse.ApprovalRefNo ??""),
                                    ),   
                                  ],  
                                ),
                                
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Text("Response Code"),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child:
                                          Text(flutterUpiResponse.responseCode),
                                    ),
                                  ],
                                ),
                              SizedBox(height: 20),
                              Text("Thank You,Your Kind Gesture is highly appreciated!!!",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                                ),
                              ],
                            );
                          }
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlatButton(
                color: Colors.blue,
                child: Text(
                  "Pay Now with BHIM UPI",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _initiateTransaction =initiateTransaction(FlutterUpiApps.BHIMUPI);
                  setState(() {});
                },
              ),
              Divider(
                height: 1.0,
                color: Colors.white,
              ),
              FlatButton(
                color: Colors.blue,
                child: Text(
                  "Pay Now with Google Pay",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _initiateTransaction =
                      initiateTransaction(FlutterUpiApps.GooglePay);
                  setState(() {});
                },
              ),
              Divider(
                height: 1.0,
                color: Colors.white,
              ),
              FlatButton(
                color: Colors.blue,
                child: Text(
                  "Pay Now with PhonePe",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _initiateTransaction =
                      initiateTransaction(FlutterUpiApps.PhonePe);
                  setState(() {});
                },
              ),
              
            ],
          ),
      ),
    );
  }
}