import 'package:flutter/material.dart';

class MostAffectedStates extends StatelessWidget {

final List StateData;

  const MostAffectedStates({Key key, this.StateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index ){
        return Container(
          margin: EdgeInsets.symmetric(vertical:5 ,horizontal: 10),
          child: Row(
            children: <Widget>[
              Icon(Icons.room),
              SizedBox(width:10,),
              Text(StateData[index]['state'],style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width:10,),
              Text("=>",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width:10,),
              Text('Confirmed: ' + StateData[index]['confirmed'].toString(),style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold), ),
            ],
          ),
        );
      },
      itemCount: 5,
      ),
    );
  }
}