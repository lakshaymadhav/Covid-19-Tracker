import 'dart:convert';
import 'package:Covid19_Tracker/pages/DistrictSubPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'DistrictData.dart';
import 'package:flutter/material.dart';
import 'searchstate.dart';
import 'services.dart';

class DistrictPage extends StatefulWidget {
  @override
  _DistrictPageState createState() => _DistrictPageState();
}

class _DistrictPageState extends State<DistrictPage> {
  List<DistrictData> _DistrictData;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getData().then((DistrictData) {
      // _DistrictData=DistrictData;
      setState(() {
        _DistrictData = DistrictData;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        
       title: Text("District Stats"),
      ),
      body: _loading?Center(child: CircularProgressIndicator(),):
      ListView.builder(
        itemCount: null==_DistrictData?0:_DistrictData.length,
        itemBuilder: (context, index) {
          DistrictData data=_DistrictData[index];
           return ListTile(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>DistrictSubPage(districtData: data.districtData,)));
             },
            title: Text(data.state,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              subtitle: Text(data.statecode,style: TextStyle(fontSize: 14),),
          );
        },
        ),
=======
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: SearchState(_DistrictData));
            },
          ),
        ],
        title: Text("District Stats"),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: null == _DistrictData ? 0 : _DistrictData.length,
              itemBuilder: (context, index) {
                DistrictData data = _DistrictData[index];
                return ListTile(
                  title: Text(data.state),
                  subtitle: Text(data.statecode),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DistrictSubPage(
                          districtData: data.districtData,
                        ),
                      )),
                );
              },
            ),
>>>>>>> 71ded4ae4556d8c4b467d3554e86cc65f7cfde4c
    );
  }
}
