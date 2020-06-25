import 'package:flutter/material.dart';

class IndiaPanel extends StatelessWidget {
  final Map IndiaData;

  const IndiaPanel({Key key, this.IndiaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          
           StatusPanel(
             title: "CONFIRMED",
             PanelColor: Colors.red[100],
             TextColor: Colors.red,
             counter: IndiaData['confirmed'].toString(),
             newly: IndiaData['cChanges'].toString(),
             ),
          
          StatusPanel(
            title: "ACTIVE",
            PanelColor: Colors.blue[100],
            TextColor: Colors.blue[900],
            counter: IndiaData['active'].toString(),
            newly: IndiaData['aChanges'].toString(),
          ),
          StatusPanel(
            title: "RECOVERED",
            PanelColor: Colors.green[100],
            TextColor: Colors.green,
            counter: IndiaData['recovered'].toString(),
            newly: IndiaData['rChanges'].toString(),
          ),
          StatusPanel(
            title: "DEATHS",
            PanelColor: Colors.grey[400],
            TextColor: Colors.grey[900],
            counter: IndiaData['deaths'].toString(),
            newly: IndiaData['dChanges'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color PanelColor;
  final Color TextColor;
  final String title;
  final String counter;
  final String newly;

  const StatusPanel(
      {Key key, this.PanelColor, this.TextColor, this.title, this.counter,this.newly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
     ),
    margin: EdgeInsets.all(10),
    color: PanelColor,
    
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
    title,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16, color: TextColor),
        ),
        Text(
    counter,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16, color: TextColor),
        ),
         Text(
    "[+"+newly+"]",
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 14, color: TextColor),
        ),
      ],
    ),
        );
  }
}
