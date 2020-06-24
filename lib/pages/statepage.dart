import 'package:flutter/material.dart';
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
        title: Text("State Stats"),
      ),
      body: StateData == null? Center(child: CircularProgressIndicator()): ListView.builder(
      itemCount: StateData==null?0:StateData.length,
      itemBuilder: (context, index) {
        return Container(
          height: 130,
          margin: EdgeInsets.symmetric(horizontal:10,vertical: 10 ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey[100],blurRadius: 10,offset: Offset(0,10,)),
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_city,size: 80,),
                    Text(StateData[index]['state'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('CONFRIMED: '+StateData[index]['confirmed'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                      Text('ACTIVE: '+StateData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                      Text('RECOVERED: '+StateData[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                      Text('DEATHS: '+StateData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
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