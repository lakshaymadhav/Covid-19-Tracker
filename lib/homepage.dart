import 'dart:convert';
import 'package:Covid19_Tracker/pages/statepage.dart';
import 'package:Covid19_Tracker/panels/Indiapanel.dart';
import 'package:Covid19_Tracker/panels/infopanel.dart';
import 'package:Covid19_Tracker/panels/mostaffectedstates.dart';
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
        await http.get('https://api.covidindiatracker.com/total.json');
    setState(() {
      IndiaData = json.decode(response.body);
    });
  }


  List StateData;
  fetchStateData() async {
    http.Response response =
        await http.get('https://api.covidindiatracker.com/state_data.json');
    setState(() {
      StateData = json.decode(response.body);
    });
  }
 
  @override
  void initState() {
    // TODO: implement initState
    fetchIndiaData();
    fetchStateData();
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[ 
                Text("INDIA",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StatePage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: primaryBlack,
                        borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text("Regional",style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold),)
                    
                    ),
                ),
                
                  ],
                ),
            ),
            IndiaData == null? CircularProgressIndicator(): IndiaPanel(
                    IndiaData: IndiaData,
                  ),
            
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:10.0),
               child: Text("Most Affected States",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
             ),

            SizedBox(height:10),

             StateData==null?Container():MostAffectedStates(StateData: StateData,),
             InfoPanel(),
             SizedBox(height: 20,),
             Center(child: Text('STAY HOME, STAY SAFE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
             SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
