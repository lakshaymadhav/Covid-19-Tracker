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
                            Text('Confirmed:'),
                            Text(_currentData.confirmed.toString()),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('Active:'),
                            Text(_currentData.active.toString()),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Deceased:'),
                            Text(_currentData.deceased.toString()),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('Recovered:'),
                            Text(_currentData.recovered.toString()),
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
                              Text('Confirmed:'),
                              Text(_currentData.delta.confirmed.toString()),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('Recovered:'),
                              Text(_currentData.delta.recovered.toString()),
                            ],
                          )
                        ],
                      ),
                      Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Deceased:'),
                          Text(_currentData.delta.deceased.toString())
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
