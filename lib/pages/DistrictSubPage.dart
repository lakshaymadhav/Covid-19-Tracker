import 'package:flutter/material.dart';

import 'DistrictData.dart';

class DistrictSubPage extends StatelessWidget {
  final List<DistrictDatum> districtData;
  DistrictDatum _currentData;

  DistrictSubPage({Key key, this.districtData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("District Data"),
      ),
      body: ListView.builder(
          itemCount: districtData?.length ?? 0,
          itemBuilder: (context, index) {
            _currentData = districtData[index];
            return Card(
              elevation: 2.0,
              child: ExpansionTile(
                title: Center(
                    child: Text(
                  _currentData.district,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Confirmed:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                            Text(_currentData.confirmed.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('Active:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                            Text(_currentData.active.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Deceased:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                            Text(_currentData.deceased.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('Recovered:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                            Text(_currentData.recovered.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text("TODAY",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Confirmed:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                              Text(_currentData.delta.confirmed.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('Recovered:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                              Text(_currentData.delta.recovered.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                            ],
                          )
                        ],
                      ),
                      Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Deceased:',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,)),
                          Text(_currentData.delta.deceased.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)
                        ],
                      ))
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
