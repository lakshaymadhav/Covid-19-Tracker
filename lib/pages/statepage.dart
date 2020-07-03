

import 'package:Covid19_Tracker/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http; 
import 'dart:convert';

class StatePage extends StatefulWidget {
  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {

  
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
    fetchStateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: (){
              showSearch(context: context, delegate: Search(StateData));
            },
            ),
        ],

 
        title: Text("State Stats"),
      ),
      body: tamilnadu == null? Center(child: CircularProgressIndicator()): 
      ListView.builder(
      itemCount: tamilnadu==null?0:tamilnadu.length,
      itemBuilder: (context, index) {
        return Container(
            height: 140,
            margin: EdgeInsets.symmetric(horizontal:10,vertical: 10 ),
            child: Row(
            children: <Widget>[
            Container(
              width: 180,
              margin: EdgeInsets.symmetric(horizontal: 10,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
        Icon(FontAwesomeIcons.city,size: 50,),
        SizedBox(height: 7,),
        Text(StateData[index]['state'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text('CONFIRMED: '+StateData[index]['confirmed'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                    Text('[+'+StateData[index]['cChanges'].toString()+"]",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                    Text('ACTIVE: '+StateData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                    Text('['+StateData[index]['aChanges'].toString()+']',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                    Text('RECOVERED: '+StateData[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                    Text('[+'+StateData[index]['rChanges'].toString()+']',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                    Text('DEATHS: '+StateData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                    Text('[+'+StateData[index]['dChanges'].toString()+']',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                  ],
                ),
              ),
            ),
                ],
              ),
           );
        },
      ),
    ); 
  }
}