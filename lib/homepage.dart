import 'dart:convert';
import 'package:Covid19_Tracker/widgets/Indiapanel.dart';
import 'package:flutter/material.dart';
import 'datasoruce.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map IndiaData;
  fetchIndiaData() async {
    http.Response response =
        await http.get('https://api.rootnet.in/covid19-in/stats/latest');
    setState(() {
      IndiaData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchIndiaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('COIVD-19 TRACKER APP'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 75,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                DataSource.quote,
                style: TextStyle(
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                "INDIA",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            IndiaData == null
                ? CircularProgressIndicator()
                : IndiaPanel(
                    IndiaData: IndiaData,
                  ),
          ],
        ),
      ),
    );
  }
}
